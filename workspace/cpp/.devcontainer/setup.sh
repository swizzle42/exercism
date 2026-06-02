#!/usr/bin/env bash

set -euo pipefail

current_dir=$(pwd)
parent_dir=$(dirname $current_dir)
readonly env_file=""$current_dir"/.env"

function error() {
    echo "Error on line $1"
    exit 1
}

trap 'error $LINENO' ERR

function main() {
    validate_env_file
    load_environment
    validate_exercism_token
    configure_exercism
}

function load_environment() {
    set -a
    . "$env_file"
    set +a
}

function validate_env_file() {
    if [[ ! -f $env_file ]]; then
        print "WARNING: .env file missing. Setup aborted."
        exit 0
    fi
}

function validate_exercism_token() {
    if [[ -z $EXERCISM_TOKEN ]]; then
        print "WARNING: Exercism Token is empty. Setup aborted."
        exit 0
    fi
}

function configure_exercism() {
    exercism configure --token="$EXERCISM_TOKEN" --workspace="$parent_dir" \
    &>/dev/null &&
    print "Exercism configured successfully"
}

function print() {
    printf "%b\n" "$@"
}

main