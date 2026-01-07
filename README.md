# Claude Code Tools & Prompts

A personal repository for collecting reusable Claude Code tools, prompts, and configurations.

## Installed Plugins

Currently installed from the [Agent37 Skills Collection](https://github.com/Agent-3-7/agent37-skills-collection):

| Plugin | Command | Description |
|--------|---------|-------------|
| **local-review** | `/local-review` | Code review uncommitted local changes for bugs, security vulnerabilities, and CLAUDE.md compliance. Uses parallel agents for thorough review. |
| **yc-advisor** | `/yc-advisor` | YC startup advisor with access to 434 curated resources from Y Combinator's library covering fundraising, product-market fit, team building, and more. |

### Installing Plugins

```bash
# Add a marketplace
/plugin marketplace add Agent-3-7/agent37-skills-collection

# Install a plugin
/plugin install local-review@agent37-skills
/plugin install yc-advisor@agent37-skills

# Restart Claude Code to load new plugins
```

## Structure

| Directory | Contents |
|-----------|----------|
| `prompts/` | Reusable prompts and system prompts |
| `mcp-servers/` | MCP server configurations |
| `skills/` | Custom slash commands |
| `hooks/` | Hook scripts and configurations |
| `templates/` | CLAUDE.md templates for different project types |

## Usage

### For Other Claude Code Instances

Direct Claude Code to this repository and ask it to browse `CATALOG.md` to find tools that match your needs. Claude can then copy configurations to your project.

### Adding New Tools

1. Add the tool to the appropriate directory
2. Update `CATALOG.md` with a description
3. Include usage instructions in the tool's file or directory

## Files

- `CATALOG.md` - Browsable index of all available tools
- `CLAUDE.md` - Instructions for visiting Claude instances
