---
description: Browse and install tools from the Claude Setup catalog
---

# /shop

Browse and install tools, prompts, MCP servers, and skills from the Claude Setup tools catalog.

## Usage

- `/shop` - Browse the full catalog
- `/shop search <term>` - Search for tools matching a term
- `/shop install <tool>` - Get installation instructions for a specific tool

## Instructions

When the user invokes `/shop`, perform these steps:

### Step 1: Fetch the Catalog

Use WebFetch to retrieve the catalog from:
```
https://raw.githubusercontent.com/The-Awkward-Customer/Claude-Setup/main/CATALOG.md
```

### Step 2: Process the Request

**If no arguments** (`/shop`):
- Display a summary of available tools organized by category
- Show the "Tools at a Glance" table
- Offer to show details for any specific tool

**If searching** (`/shop search <term>`):
- Search the catalog for matching tools by name, description, or tags
- Display matching results with brief descriptions
- Offer installation help for any match

**If installing** (`/shop install <tool>`):
- Find the tool in the catalog
- Display full installation instructions
- For skills: offer to copy the skill file to `~/.claude/skills/`
- For MCP servers: show the JSON config to add to `.mcp.json` or `~/.claude.json`
- For plugins: show the `/plugin install` command
- For external tools: show the installation commands

### Step 3: Offer Next Steps

After any action, remind the user they can:
- Search for more tools: `/shop search <term>`
- Get install help: `/shop install <tool>`
- Install this skill globally for easy access:
  ```bash
  # Copy shop.md to global skills
  curl -o ~/.claude/skills/shop.md https://raw.githubusercontent.com/The-Awkward-Customer/Claude-Setup/main/skills/shop.md
  ```

## Catalog Source

- **Repository**: https://github.com/The-Awkward-Customer/Claude-Setup
- **Raw Catalog**: https://raw.githubusercontent.com/The-Awkward-Customer/Claude-Setup/main/CATALOG.md

## Example Responses

### For `/shop`
```
## Claude Setup Tools Catalog

| Tool | Status | Category |
|------|--------|----------|
| /local-review | [ALWAYS] | Plugin |
| /yc-advisor | [SPECIFIC] | Plugin |
| Beads | [EXPERIMENTAL] | External Tool |
| GitHub Spec Kit | [EXPERIMENTAL] | External Tool |
| /shop | [ALWAYS] | Skill |

Use `/shop search <term>` to find specific tools
Use `/shop install <tool>` for installation instructions
```

### For `/shop install beads`
```
## Installing Beads

Beads is a distributed, git-backed issue tracker for AI coding agents.

### Installation
curl -fsSL https://raw.githubusercontent.com/steveyegge/beads/main/scripts/install.sh | bash

### Initialize in your project
bd init

### Add to your CLAUDE.md
echo "Use 'bd' for task tracking" >> CLAUDE.md
```
