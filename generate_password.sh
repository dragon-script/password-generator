#!/bin/bash

# Function to generate a random password
generate_password() {
    local length=$1
    local use_lowercase=$2
    local use_uppercase=$3
    local use_digits=$4
    local use_special_chars=$5
    local password=""

    # Define character sets
    local lowercase="abcdefghijklmnopqrstuvwxyz"
    local uppercase="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    local digits="0123456789"
    local special_chars="!@#$%^&*()-=_+"

    # Combine character sets based on user preferences
    local all_chars="${lowercase}"
    [ "$use_uppercase" == true ] && all_chars="${all_chars}${uppercase}"
    [ "$use_digits" == true ] && all_chars="${all_chars}${digits}"
    [ "$use_special_chars" == true ] && all_chars="${all_chars}${special_chars}"

    # Validate that at least one character set is selected
    if [ -z "$all_chars" ]; then
        echo "Error: Please select at least one character set."
        exit 1
    fi

    # Generate the password
    for ((i = 0; i < length; i++)); do
        password="${password}${all_chars:RANDOM%${#all_chars}:1}"
    done

    echo "$password"
}

# Set default options
password_length=12
include_lowercase=true
include_uppercase=true
include_digits=true
include_special_chars=true

# Parse command-line options
while getopts ":l:udsc" opt; do
    case $opt in
        l)
            password_length="$OPTARG"
            ;;
        u)
            include_uppercase=false
            ;;
        d)
            include_digits=false
            ;;
        s)
            include_special_chars=false
            ;;
        c)
            include_lowercase=false
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            exit 1
            ;;
    esac
done

# Generate and display the password
generated_password=$(generate_password "$password_length" "$include_lowercase" "$include_uppercase" "$include_digits" "$include_special_chars")
echo "Generated Password: $generated_password"
