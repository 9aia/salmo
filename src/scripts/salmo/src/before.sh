## before hook
##
## Any code here will be placed inside the `before_hook()` function and called
## before running any command (but after argument processing is complete).
##
## - The processed args are available to you here as `args` and `extra_args`
## - The raw input array is also available in read-only mode as `input`
##
## You can safely delete this file if you do not need it.

# Define default values
SALMO_FILES_DIR="./src/files"
SALMO_PACKAGES_FILE="./src/packages.yml"
SALMO_DEFAULT_PACKAGE_MANAGER="pacman"
SALMO_BUILD_OUT_DIR="./dist"
SALMO_BUILD_FILENAME="luis-de"

# Load configuration
CONFIG_PATH="${args[--config]}"

if [[ -f "$CONFIG_PATH" ]]; then
    log_info "Loading configuration from $CONFIG_PATH"
    eval "$(yaml_load "$CONFIG_PATH" SALMO_)"
fi
