setup_usb() {
    log_info "Initializing bootable USB setup..."
    
    log_info "Installing dependencies..."
    sudo pacman -S git curl transmission-cli
    yay -S ventoy-bin --noconfirm
    log_success "Dependencies installed"

    transmission-cli "$(curl --silent '[url]https://archlinux.org/feeds/releases/[/url]' | xml sel -t -v '//channel/item[1]/link' ; printf '%s\n' 'torrent')"

    log_info "Downloading Arch Linux torrent..."
    curl https://archlinux.org/releng/releases/2025.08.01/torrent/archlinux-2025.08.01-x86_64.iso.torrent -O archlinux.iso.torrent
    log_success "Arch Linux torrent downloaded"

    log_info "Downloading Arch Linux ISO..."
    transmission-cli https://archlinux.org/releng/releases/2025.08.01/torrent/archlinux-2025.08.01-x86_64.iso.torrent -O archlinux.iso

    # Check if USB drives are available
    log_info "Checking for available USB drives..."
    usb_drives=$(lsblk -o NAME,SIZE,TYPE,MOUNTPOINT | grep -E "disk|part" | grep -v "loop")
    
    if [ -z "$usb_drives" ]; then
        log_error "No USB drives found. Please insert a USB drive and try again."
        exit 1
    fi
    
    echo "Available storage devices:"
    echo "$usb_drives"
    
    # Prompt user to select USB drive
    read -p "Enter the USB drive device (e.g., /dev/sdb): " usb_device
    
    # Validate USB device exists
    if [ ! -b "$usb_device" ]; then
        log_error "Device $usb_device does not exist or is not a block device."
        exit 1
    fi
    
    # Check if USB is mounted and unmount if necessary
    mounted_partitions=$(mount | grep "$usb_device" | awk '{print $1}')
    if [ -n "$mounted_partitions" ]; then
        log_info "USB drive is mounted. Unmounting partitions..."
        for partition in $mounted_partitions; do
            sudo umount "$partition"
            log_info "Unmounted $partition"
        done
    fi
    
    # Check if USB is writable
    if [ ! -w "$usb_device" ]; then
        log_info "USB drive is not writable by current user. Will use sudo for operations."
    fi

    # TODO: inform if the USB drive is already setup with Ventoy
    log_info "Setting up USB drive with Ventoy..."
    # TODO: finish this
    # TODO: add a option to select the USB drive
    sudo ventoy -i /dev/sdX

    log_info "Copying Arch Linux ISO to USB drive..."
    # TODO: add a option to select the USB drive
    sudo cp archlinux.iso /dev/sdX1

    log_success "Bootable USB setup completed."

    # Confirm if the user wants to reboot
    read -p "Do you want to reboot now? (y/n): " confirm
    if [[ $confirm == "y" ]]; then
        reboot
    fi
}

setup_usb
