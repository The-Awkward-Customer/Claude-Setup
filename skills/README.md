# Skills

Custom slash commands for Claude Code.

## Adding a Skill

1. Create a `.md` file named after the command (e.g., `deploy.md` for `/deploy`)
2. Add an entry to `../CATALOG.md`

## Skill Format

```markdown
---
description: Short description shown in /help
---

# /command-name

Instructions for Claude when this command is invoked.

## Steps
1. First step
2. Second step
...
```

## Installation

Copy the skill file to:
- **Project-level**: `.claude/skills/` in your project
- **Global**: `~/.claude/skills/`

## Invoking

Use `/command-name` in Claude Code to invoke the skill.
