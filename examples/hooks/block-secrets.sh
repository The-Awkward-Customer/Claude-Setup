#!/bin/bash
# block-secrets.sh - PreToolUse hook
# Blocks Claude from editing sensitive files like .env, credentials, etc.
#
# Install:
#   1. Copy to .claude/hooks/block-secrets.sh
#   2. chmod +x .claude/hooks/block-secrets.sh
#   3. Add to .claude/settings.json (see settings-snippet.json)
#
# How it works:
#   - Receives tool call info via stdin as JSON
#   - Checks if the file being edited matches sensitive patterns
#   - Exits with code 2 to BLOCK the operation
#
# Exit codes:
#   0 = Success (allow tool to proceed)
#   1 = Error (logged but tool proceeds)
#   2 = BLOCK (prevents tool execution)

# Read the tool call JSON from stdin
INPUT=$(cat)

# Extract the file path from Edit or Write tool parameters
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# Exit if no file path
if [ -z "$FILE_PATH" ]; then
    exit 0
fi

# Get just the filename
FILENAME=$(basename "$FILE_PATH")

# List of blocked patterns
BLOCKED_PATTERNS=(
    ".env"
    ".env.local"
    ".env.production"
    ".env.development"
    "credentials.json"
    "secrets.json"
    "*.pem"
    "*.key"
    "id_rsa"
    "id_ed25519"
)

# Check against blocked patterns
for pattern in "${BLOCKED_PATTERNS[@]}"; do
    case "$FILENAME" in
        $pattern)
            echo "BLOCKED: Cannot edit sensitive file: $FILENAME"
            echo "This file matches blocked pattern: $pattern"
            exit 2  # Exit code 2 = BLOCK the operation
            ;;
    esac
done

# Also check the full path for .env files in any directory
if [[ "$FILE_PATH" =~ \.env($|\.) ]]; then
    echo "BLOCKED: Cannot edit .env file: $FILE_PATH"
    exit 2
fi

# Allow the operation
exit 0
