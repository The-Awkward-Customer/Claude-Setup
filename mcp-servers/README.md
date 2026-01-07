# MCP Servers

Model Context Protocol server configurations.

## Adding an MCP Server

1. Create a `.json` file with the server configuration
2. Add an entry to `../CATALOG.md`

## Configuration Format

```json
{
  "server-name": {
    "command": "npx",
    "args": ["-y", "@package/mcp-server"],
    "env": {}
  }
}
```

## Installation

Copy the configuration to:
- **Project-level**: `.mcp.json` in your project root
- **Global**: `~/.claude.json` under `mcpServers`

## Example

```json
{
  "filesystem": {
    "command": "npx",
    "args": ["-y", "@anthropic/mcp-filesystem", "/path/to/allowed/dir"]
  }
}
```
