pull_packages() {
    log_info "Pulling packages..."

    pacman -Qmq > src/packages/yay.txt
    pacman -Qeq > src/packages/pacman.txt

    # Sort the package lists to ensure comm works correctly
    sort -o src/packages/pacman_sorted.txt src/packages/pacman.txt
    sort -o src/packages/yay_sorted.txt src/packages/yay.txt

    # Use comm to find packages in the pacman list that aren't in the yay list
    # The -23 flags suppress lines unique to file2 and lines common to both
    comm -23 src/packages/pacman_sorted.txt src/packages/yay_sorted.txt > src/packages/pacman_filtered.txt

    # Replace the original pacman list with the filtered one
    mv src/packages/pacman_filtered.txt src/packages/pacman.txt

    # Clean up the temporary sorted files
    rm src/packages/pacman_sorted.txt src/packages/yay_sorted.txt

    log_success "Packages pulled successfully"
}

pull_packages
