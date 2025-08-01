#!/bin/bash
#
# =================================================================
# source.sh
# =================================================================
#
# Author: Rodrigo Barreiro
# Date: Month DD, 2025
#
#
# Description:
# Template for creating and registering a new script while developing
# a new pipeline.
#
# =================================================================

WD=$(pwd)

# --- Helper Functions ---
print_header() {
    # Print header
    printf "\n\n"
    echo "================================================================"
    printf "  Running: $(sed 's|.*/|.../|' <<< $WD)/${COLOR}${BASH_SOURCE[0]}${RESET}\n"
    echo "================================================================"
    printf "\n"
}

print_footer() {
    # Print footer
    set +x # Disable command printing
    local duration=$SECONDS
    printf "\n${COLOR2}----------------------------------------------------------------${RESET}\n"
    printf "  Execution Time: $(($duration / 60))m $(($duration % 60))s | $(date)\n"
    echo "================================================================"
    printf "\n"
}

# --- Script Options and Error Handling ---
# | Option          | Description                                                                                             |
# | :-------------- | :------------------------------------------------------------------------------------------------------ |
# | `set -e`        | Exit immediately if a command exits with a non-zero status.                                             |
# | `set -u`        | Treat unset variables as an error when substituting.                                                    |
# | `set -o pipefail` | The return value of a pipeline is the status of the last command to exit with a non-zero status.      |
set -euo pipefail

# --- Custom command printing (PS4) ---
COLOR='\033[0;33m'
COLOR2='\033[0;30m'
RESET='\033[0m'
export PS4="\[${COLOR2}\]- \t \${LINENO} \[${COLOR}\]\${FUNCNAME[0]}\[${RESET}\] "

# --- Main Function ---
main() {
    # --- Starting ---
    print_header
    set -x # Start command printing
    mkdir -p ${WD}/input
    mkdir -p ${WD}/steps
    mkdir -p ${WD}/scripts
    mkdir -p ${WD}/output

    # --- Functions ---
    step01_functioname

    # --- Ending ---
    set +x # End command printing
    print_footer
}


# --- Step Functions ---
step01_functioname(){
    # Download example data
    my_dir="${WD}/steps/${FUNCNAME[0]}"
    mkdir -p ${my_dir}

}

# --- Run Main ---
main "$@"
