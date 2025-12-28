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
config_files_dir="./src/files"
config_packages_dir="./src/packages"
config_build_out_dir="./dist"
config_build_filename="luis-de"

# Load configuration
CONFIG_PATH="${args[--config]}"

if [[ -f "$CONFIG_PATH" ]]; then
    log_info "Loading configuration from $CONFIG_PATH"
    eval "$(yaml_load "$CONFIG_PATH" config_)"
fi
