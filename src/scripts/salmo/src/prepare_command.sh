prepare_home_files() {
    log_info "Preparing home files..."

    if [[ ! -d "$config_files_dir$HOME" ]]; then
        log_warning "No home files directory found at $config_files_dir$HOME. Skipping home files preparation."
        return
    fi

    # Recursively copies everything from the directory path formed by concatenating the value of $config_files_dir and $HOME into your home directory ($HOME). All files and subdirectories from the source are duplicated into the destination, preserving the directory structure. If files with the same name exist in the destination, they will be overwritten.
    log_info "Copying all home files from $config_files_dir$HOME to $HOME"
    rsync -av "$config_files_dir$HOME"/. "$HOME"/

    log_success "Home files copied successfully!"
}

prepare_non_home_files() {
    log_info "Copying all non-home files..."

    # Copy all files except $HOME from $config_files_dir to /
    sudo rsync -av --exclude="$HOME" "$config_files_dir"/ / 

    log_success "Non-home files copied successfully!"
}

apply_bin() {
    log_info "Applying binary executables..."

    log_info "Updating permissions for binary executables..."
    sudo chmod +x /usr/local/bin/*

    log_info "Reloading .bashrc to apply changes..."
    source ~/.bashrc

    log_success "Binary executables applied successfully!"
}

apply_aliases() {
    log_info "Applying aliases..."

    log_info "Updating permissions for aliases..."
    sudo chmod +x "/usr/local/aliases"/*

    log_info "Ensuring aliases are sourced in ~/.bashrc"
    for alias_file in "/usr/local/aliases"/*.sh; do
        if [[ -f "$alias_file" ]]; then
            alias_source_line="source $alias_file"

            if ! grep -qxF "$alias_source_line" ~/.bashrc; then
                echo "$alias_source_line" >> ~/.bashrc
            fi
        fi
    done

    log_info "Reloading .bashrc to apply changes..."
    source ~/.bashrc

    log_success "Aliases applied successfully!"
}

apply_special_files() {
    log_info "Applying special files..."
    
    apply_aliases
    apply_bin

    log_success "Special files applied successfully!"
}

prepare() {
    prepare_home_files
    prepare_non_home_files
    apply_special_files
}

prepare
