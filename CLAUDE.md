# Claude Code Tools Repository

> **Purpose**: A tools repository containing reusable prompts, MCP servers, skills, hooks, and templates for Claude Code projects.

## Quick Reference

| Action | What to Do |
|--------|------------|
| **Browse tools** | Read `CATALOG.md` |
| **Find install paths** | See [Installation Locations](#installation-locations) below |
| **Track tasks** | Use `bd` commands (Beads) |
| **Make changes** | See [Git Workflow](#git-workflow-required-for-changes) at end |

---

## When You Arrive Here ("Shopping" Mode)

If a user directed you here to find tools:

1. Read `CATALOG.md` to understand what's available
2. Ask the user what kind of functionality they need
3. Recommend relevant tools from the catalog
4. Help copy/install the selected tools to their project

## How to Use This Repository

1. **Browse the catalog**: Read `CATALOG.md` to see all available tools with descriptions
2. **Find what you need**: Tools are organized by category (prompts, mcp-servers, skills, hooks, templates)
3. **Copy to your project**: Once you find a useful tool, copy its contents to the appropriate location in your target project

## Directory Structure

| Directory | Contents | Install Location |
|-----------|----------|------------------|
| `prompts/` | Reusable prompts and system prompts | Copy to conversation |
| `mcp-servers/` | MCP server configurations | `.mcp.json` or `~/.claude.json` |
| `skills/` | Custom slash commands | `.claude/skills/` or `~/.claude/skills/` |
| `hooks/` | Hook scripts | `.claude/settings.json` hooks section |
| `templates/` | CLAUDE.md templates for projects | `CLAUDE.md` (project root) |

## Installation Locations

| Tool Type | Project Location | Global Location |
|-----------|-----------------|-----------------|
| MCP Servers | `.mcp.json` | `~/.claude.json` |
| Skills | `.claude/skills/` | `~/.claude/skills/` |
| Hooks | `.claude/settings.json` | `~/.claude/settings.json` |
| CLAUDE.md | `CLAUDE.md` (root) | N/A |

---

## Git Workflow (Required for Changes)

**IMPORTANT**: All changes must follow enterprise-level git practices. Never commit directly to `main`.

### Branch Strategy

1. **Protected branches**: `main` is protected. All changes require a PR.
2. **Branch naming convention**:
   - `feature/<ticket-or-description>` - New features
   - `fix/<ticket-or-description>` - Bug fixes
   - `docs/<description>` - Documentation updates
   - `refactor/<description>` - Code refactoring
   - `chore/<description>` - Maintenance tasks

### Workflow Steps

1. **Create a feature branch** before making any changes:
   ```bash
   git checkout -b feature/add-new-skill
   ```

2. **For complex work, use git worktrees** to work on multiple branches simultaneously:
   ```bash
   # Create a worktree for a new feature
   git worktree add ../claude-setup-feature-xyz feature/xyz

   # List active worktrees
   git worktree list

   # Remove when done
   git worktree remove ../claude-setup-feature-xyz
   ```

3. **Make atomic commits** - each commit should represent one logical change:
   - Keep commits small and focused
   - Write clear commit messages (see format below)
   - Commit early and often

4. **Push and create a PR**:
   ```bash
   git push -u origin feature/add-new-skill
   gh pr create --title "Add new skill" --body "Description of changes"
   ```

5. **Merge via PR** after review (squash merge preferred for clean history)

### Commit Message Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

**Types**: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`

**Example**:
```
feat(skills): add deployment automation skill

- Added /deploy skill for staging and production
- Includes rollback support
- Validates environment before deployment

Closes #123
```

### Code Review Checklist

Before creating a PR, ensure:
- [ ] Changes are on a feature branch (not `main`)
- [ ] Commit messages follow the format above
- [ ] CATALOG.md is updated if adding new tools
- [ ] README.md is updated if changing structure
- [ ] No secrets or credentials in commits

### Worktree Best Practices

Use worktrees when:
- Working on multiple features simultaneously
- Need to quickly switch context without stashing
- Reviewing a PR while working on something else
- Running long tests on one branch while coding on another

```bash
# Recommended worktree directory structure
~/projects/
├── claude-setup/              # Main worktree (main branch)
├── claude-setup-feature-a/    # Feature A worktree
└── claude-setup-feature-b/    # Feature B worktree
```
