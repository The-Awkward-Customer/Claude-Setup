# Roadmap

A living document outlining the vision, current state, and future direction for this Claude Code tools repository.

---

## Vision

This repository serves as a **centralized "shop"** for Claude Code resources:

- **Central hub** for tools, prompts, configurations across all projects
- **Self-service** for Claude instances directed here to browse and adopt tools
- **Personal toolkit** that grows and improves over time
- **Standardized patterns** ensuring consistency across projects

### How the "Shop" Works

1. Direct a Claude Code instance to this repository
2. Claude reads `CLAUDE.md` for instructions
3. Claude browses `CATALOG.md` to find relevant tools
4. Claude helps install/copy tools to the target project

---

## Current State

### Infrastructure
- [x] Repository structure with categorized directories
- [x] Git workflow (branches, PRs, conventional commits)
- [x] Beads task tracking initialized
- [x] Documentation optimized for both LLMs and humans
- [x] Tool status tracking system

### Tools Available

| Tool | Status | Category |
|------|--------|----------|
| /local-review | [ALWAYS] | Plugin |
| /yc-advisor | [SPECIFIC] | Plugin |
| Beads | [EXPERIMENTAL] | External Tool |

### Empty Categories
- `prompts/` - No prompts yet
- `mcp-servers/` - No MCP configs yet
- `skills/` - No custom skills yet
- `hooks/` - No hooks yet
- `templates/` - No templates yet

---

## Next Steps

Priority: **Skills and Automation First**

### 1. Create /shop Skill
Build a skill that helps Claude instances browse and install tools from this catalog.

**Acceptance criteria:**
- Reads CATALOG.md
- Asks user what they need
- Recommends relevant tools
- Helps with installation

### 2. Build Automation Helpers
Scripts for common operations:
- Tool usage discovery across projects
- Status updates
- Catalog maintenance

### 3. Add MCP Server Configs
Document and add commonly used MCP server configurations.

### 4. Populate Templates
Create CLAUDE.md templates for:
- TypeScript projects
- Python projects
- Full-stack applications
- CLI tools

---

## Potential Features

### Auto-Discovery
Script to scan local projects and find:
- Which tools from this catalog are in use
- Where configurations are installed
- Version mismatches

### Version Tracking
Track versions of external tools:
- Alert when updates are available
- Document breaking changes
- Migration guides

### Usage Analytics
Understand tool adoption:
- Project count per tool
- Usage frequency
- Feedback/notes

### Sync Mechanism
Push updates to projects:
- Update tool configurations
- Propagate template changes
- Batch migrations

### Tool Recipes
Pre-configured bundles for specific workflows:
- "New TypeScript Project" bundle
- "Code Quality" bundle (linting, review, testing)
- "AI-First Development" bundle

---

## Wishlist

### MCP Servers to Evaluate
- (none yet)

### Plugins to Try
- (none yet)

### Hooks to Build
- (none yet)

### Templates Needed
- TypeScript project CLAUDE.md
- Python project CLAUDE.md
- Monorepo CLAUDE.md

### Skills to Create
- /shop - Browse and install tools from this catalog
- /sync - Update tool configs across projects
- /status - Check tool health and updates

---

## Contributing

All changes follow the workflow in `CLAUDE.md`:
1. Create a feature branch
2. Make atomic commits
3. Open a PR for review
4. Squash merge to main
