## Logger functions [@bashly-upgrade ../../libraries;logger]
## This file is a custom library for logging
##
## Usage:
## Use any of the functions below to log messages with colored output.
##
##   log_info "This is an info message"
##   log_success "Operation completed successfully"
##   log_warning "This is a warning"
##   log_error "An error occurred"
##   log_debug "Debugging details"
##
## Color output will be disabled if `NO_COLOR` environment variable is set
## in compliance with https://no-color.org/
##
## In case you wish to enable auto detection for color output based on the
## terminal being interactive (TTY), call `enable_auto_colors` in your 
## `src/initialize.sh` (Run `bashly add hooks` to add this file).
##

enable_auto_colors() {
  ## If NO_COLOR has not been set and stdout is not a TTY, disable colors
  if [[ -z ${NO_COLOR+x} && ! -t 1 ]]; then
    NO_COLOR=1
  fi
}

print_in_color() {
  local color="$1"
  shift
  if [[ "${NO_COLOR:-}" == "" ]]; then
    printf "$color%b\e[0m\n" "$*"
  else
    printf "%b\n" "$*"
  fi
}

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
log_info() {
    print_in_color "${BLUE}" "[INFO] $1"
}

log_success() {
    print_in_color "${GREEN}" "[SUCCESS] $1"
}

log_warning() {
    print_in_color "${YELLOW}" "[WARNING] $1"
}

log_error() {
    print_in_color "${RED}" "[ERROR] $1"
}

log_debug() {
    print_in_color "${BLUE}" "[DEBUG] $1"
}
