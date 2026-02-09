---
description: A minimal example skill that says hello
---

# /hello

A minimal skill demonstrating the basic structure.

## When Invoked

When the user runs `/hello`, respond with:

> Hello! I'm working correctly. This skill was loaded from `~/.claude/skills/hello.md`.

Then explain:
- The `description` in the frontmatter is shown in `/help`
- These instructions are only loaded when you run `/hello`
- This is "progressive disclosure" - metadata is always loaded (~100 tokens), but full content loads on-demand

## That's It

This skill intentionally does nothing complex. It exists to demonstrate the minimal structure:

```markdown
---
description: Short description for /help listing
---

# Instructions
Content loaded only when the skill is invoked.
```
