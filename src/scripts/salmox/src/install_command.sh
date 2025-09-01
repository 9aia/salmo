install() {    
    assert_not_root
    check_system_requirements
    update_system

    # Download this repo
    git clone https://github.com/luisfuturist/de.git
    cd de

    # Run the install and config scripts
    bash src/scripts/install-de.sh
    bash src/scripts/config-de.sh

    # TODO: run scripts/prepare.sh

    log_success "Installation and configuration completed"

    # Ask if the user wants to reboot
    read -p "Do you want to reboot now? (y/n): " confirm
    if [[ $confirm == "y" ]]; then
        reboot
    fi
}

setup_basic_system_config() {
    log_info "Setting up basic system configuration..."
    
    # Set keyboard layout
    log_info "Setting keyboard layout to br-abnt2..."
    setxkbmap -layout br -variant abnt2
    
    # Set timezone
    log_info "Setting timezone to America/Sao_Paulo..."
    sudo timedatectl set-timezone America/Sao_Paulo

    # Locale
    # TODO: check if this is working
    log_info "Setting locale to en_US.UTF-8..."
    sudo sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
    sudo locale-gen
    echo "LANG=en_US.UTF-8" | sudo tee /etc/locale.conf > /dev/null

    # System language
    log_info "Setting system language to en_US..."
    localectl set-locale LANG=en_US.UTF-8
    
    log_success "Basic system configuration completed"
}

#setup_basic_system_config
install
