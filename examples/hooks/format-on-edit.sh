#!/bin/bash
# format-on-edit.sh - PostToolUse hook
# Runs Prettier on files after the Edit tool modifies them.
#
# Install:
#   1. Copy to .claude/hooks/format-on-edit.sh
#   2. chmod +x .claude/hooks/format-on-edit.sh
#   3. Add to .claude/settings.json (see settings-snippet.json)
#
# How it works:
#   - Receives tool call info via stdin as JSON
#   - Extracts the file_path from Edit tool parameters
#   - Runs Prettier on supported file types
#
# Exit codes:
#   0 = Success (allow tool to proceed)
#   1 = Error (logged but tool proceeds)
#   2 = Block (prevents tool execution - not used here)

# Read the tool call JSON from stdin
INPUT=$(cat)

# Extract the file path from the Edit tool's parameters
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# Exit if no file path (shouldn't happen for Edit tool)
if [ -z "$FILE_PATH" ]; then
    exit 0
fi

# Only format supported file types
case "$FILE_PATH" in
    *.js|*.ts|*.jsx|*.tsx|*.json|*.md|*.css|*.scss|*.html)
        # Check if prettier is available
        if command -v npx &> /dev/null; then
            npx prettier --write "$FILE_PATH" 2>/dev/null || true
        fi
        ;;
esac

exit 0
