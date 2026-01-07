# Hooks

Hook scripts that run in response to Claude Code events.

## Adding a Hook

1. Create a script file (`.sh`, `.js`, `.py`, etc.)
2. Add the hook configuration snippet
3. Add an entry to `../CATALOG.md`

## Hook Types

- `PreToolUse` - Before a tool executes
- `PostToolUse` - After a tool executes
- `Notification` - For notifications
- `Stop` - When Claude stops

## Configuration Format

Add to `.claude/settings.json` or `~/.claude/settings.json`:

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "/path/to/script.sh"
          }
        ]
      }
    ]
  }
}
```

## Hook Input

Hooks receive JSON on stdin with event details:
- `tool_name` - Name of the tool
- `tool_input` - Tool parameters
- `session_id` - Current session ID
