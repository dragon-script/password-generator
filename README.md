# Password Generator

## Overview

The Password Generator Script is a Bash script that generates random passwords based on user-defined parameters. It provides options for specifying the length of the password and selecting character sets, including lowercase letters, uppercase letters, digits, and special characters.

## Usage

### Running the Script

1. **Clone the Repository:**

    ```bash
    git clone https://github.com/dragon-script/password-generator.git
    ```

2. **Navigate to the Script:**

    ```bash
    cd password-generator
    ```

3. **Make the script executable:**
   ```bash
   chmod +x generate_password.sh
   ```

4. **Run the script with options:**
   ```bash
   ./generate_password.sh [OPTIONS]
   ```

### Options

- **-l LENGTH**: Specify the length of the password (default is 12).
- **-u**: Include uppercase letters in the password.
- **-d**: Include digits in the password.
- **-s**: Include special characters in the password.
- **-c**: Exclude lowercase letters from the password.

### Examples

- Generate a default 12-character password:
  ```bash
  ./generate_password.sh
  ```

- Generate a 16-character password with uppercase letters, digits, and special characters:
  ```bash
  ./generate_password.sh -l 16 -u -d -s
  ```

## Customization

You can customize the script by modifying the following variables:

- **password_length**: Default password length.
- **include_lowercase**: Include/exclude lowercase letters.
- **include_uppercase**: Include/exclude uppercase letters.
- **include_digits**: Include/exclude digits.
- **include_special_chars**: Include/exclude special characters.

## Security Considerations

- The script uses `/dev/urandom` for secure random number generation.
- Do not share generated passwords in an insecure manner.
- Ensure the script is used in a secure environment.
