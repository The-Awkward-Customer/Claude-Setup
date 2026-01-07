# Claude Code Tools Repository

You are visiting a tools repository. This repository contains reusable prompts, MCP servers, skills, hooks, and templates for Claude Code projects.

## How to Use This Repository

1. **Browse the catalog**: Read `CATALOG.md` to see all available tools with descriptions
2. **Find what you need**: Tools are organized by category (prompts, mcp-servers, skills, hooks, templates)
3. **Copy to your project**: Once you find a useful tool, copy its contents to the appropriate location in your target project

## Directory Structure

- `prompts/` - Reusable prompts and system prompts
- `mcp-servers/` - MCP server configurations (copy to project's `.mcp.json` or global settings)
- `skills/` - Custom slash commands (copy to project's `.claude/skills/` or global `~/.claude/skills/`)
- `hooks/` - Hook scripts (copy to project's `.claude/settings.json` hooks section)
- `templates/` - CLAUDE.md templates for different project types

## When the User Asks You to "Shop" for Tools

1. Read `CATALOG.md` to understand what's available
2. Ask the user what kind of functionality they need
3. Recommend relevant tools from the catalog
4. Help copy/install the selected tools to their project

## Installation Locations

| Tool Type | Project Location | Global Location |
|-----------|-----------------|-----------------|
| MCP Servers | `.mcp.json` | `~/.claude.json` |
| Skills | `.claude/skills/` | `~/.claude/skills/` |
| Hooks | `.claude/settings.json` | `~/.claude/settings.json` |
| CLAUDE.md | `CLAUDE.md` (root) | N/A |
