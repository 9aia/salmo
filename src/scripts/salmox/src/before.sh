## before hook
##
## Any code here will be placed inside the `before_hook()` function and called
## before running any command (but after argument processing is complete).
##
## - The processed args are available to you here as `args` and `extra_args`
## - The raw input array is also available in read-only mode as `input`
##
## You can safely delete this file if you do not need it.

# Constants
USERNAME="${SUDO_USER:-$USER}"
HOME_DIR="/home/$USERNAME"

# Show info
echo "Salmox - Desktop Environment Installer"
echo "https://github.com/9aia/salmo"
echo ""

echo "User: $USERNAME"
echo "Home directory: $HOME_DIR"
echo ""
