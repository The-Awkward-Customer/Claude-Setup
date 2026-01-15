# Tools Catalog

Browse available tools by category. Each entry includes a description and file path.

## Quick Index

| Category | Count | Jump |
|----------|-------|------|
| Plugins | 2 | [→ Plugins](#plugins-installed) |
| External Tools | 2 | [→ External Tools](#external-tools) |
| Prompts | 0 | [→ Prompts](#prompts) |
| MCP Servers | 0 | [→ MCP Servers](#mcp-servers) |
| Skills | 0 | [→ Skills](#skills) |
| Hooks | 0 | [→ Hooks](#hooks) |
| Templates | 0 | [→ Templates](#templates) |

**Total**: 4 tools available

### Tools at a Glance

| Tool | Status |
|------|--------|
| /local-review | [ALWAYS] |
| /yc-advisor | [SPECIFIC] |
| Beads | [EXPERIMENTAL] |
| GitHub Spec Kit | [EXPERIMENTAL] |

---

## Plugins (Installed)

Plugins installed via the `/plugin` system from external marketplaces.

### /local-review
**Status: [ALWAYS]**

- **Source**: `agent37-skills` marketplace
- **Install**: `/plugin install local-review@agent37-skills`
- **Description**: Code review uncommitted local changes for bugs, security vulnerabilities, and CLAUDE.md compliance
- **Features**:
  - Checks staged and unstaged git changes
  - Validates against CLAUDE.md guidelines
  - Scans for bugs, logic errors, edge cases
  - Security audit (OWASP top 10)
  - TypeScript type safety checks
  - Confidence scoring to filter false positives
- **Tags**: code-review, git, security, bugs, typescript

### /yc-advisor
**Status: [SPECIFIC]**

- **Source**: `agent37-skills` marketplace
- **Install**: `/plugin install yc-advisor@agent37-skills`
- **Description**: YC startup advisor with access to 434 curated resources from Y Combinator's library
- **Topics covered**:
  - Fundraising and investor relations
  - Product-market fit
  - Team building and hiring
  - Startup metrics
  - Pitching and applications
  - Growth strategies
- **Tags**: startup, yc, ycombinator, founder, entrepreneurship, fundraising

---

## External Tools

Standalone tools that integrate with Claude Code and AI agents.

### Beads
**Status: [EXPERIMENTAL]**

- **Repository**: [steveyegge/beads](https://github.com/steveyegge/beads)
- **Description**: A distributed, git-backed issue tracker and memory system for AI coding agents
- **Install**:
  ```bash
  # Install (macOS/Linux)
  curl -fsSL https://raw.githubusercontent.com/steveyegge/beads/main/scripts/install.sh | bash

  # Initialize in your project (run once)
  bd init

  # Add to CLAUDE.md or AGENTS.md
  echo "Use 'bd' for task tracking" >> CLAUDE.md
  ```
- **Features**:
  - Git-native storage (`.beads/` directory, JSONL format)
  - Dependency-aware task graph
  - Collision-free hash-based IDs (`bd-a1b2` format)
  - Hierarchical epic-to-subtask organization
  - Semantic compaction for context window efficiency
  - MCP integration for Claude Code
  - Stealth mode for local-only work
- **Key Commands**:
  - `bd ready` - List unblocked tasks ready for execution
  - `bd create` - Create a new task with priority
  - `bd dep add` - Link task dependencies
  - `bd show` - Display full task history
- **Tags**: task-tracking, memory, git, agents, mcp, project-management

### GitHub Spec Kit
**Status: [EXPERIMENTAL]**

- **Repository**: [github/spec-kit](https://github.com/github/spec-kit)
- **Description**: Toolkit for Spec-Driven Development (SDD) - build high-quality software by focusing on specifications before code
- **Install**:
  ```bash
  # Persistent installation (recommended)
  uv tool install specify-cli --from git+https://github.com/github/spec-kit.git

  # Initialize a new project
  specify init <PROJECT_NAME> --ai claude

  # Or initialize in existing project
  specify init . --ai claude
  ```
- **Features**:
  - Spec-driven workflow: specify → plan → tasks → implement
  - Multi-agent support (Claude Code, GitHub Copilot, Gemini CLI, Cursor, etc.)
  - Living specification documents that evolve with code
  - Constitution files for project principles
  - Automated task breakdown from specs
- **Slash Commands** (after `specify init`):
  - `/speckit.constitution` - Create project governing principles
  - `/speckit.specify` - Define what to build (the "what" and "why")
  - `/speckit.plan` - Create technical implementation plan (the "how")
  - `/speckit.tasks` - Break down into actionable tasks
  - `/speckit.implement` - Execute tasks to build the feature
- **Documentation**: [Official Docs](https://github.github.io/spec-kit/) | [GitHub Blog](https://github.blog/ai-and-ml/generative-ai/spec-driven-development-with-ai-get-started-with-a-new-open-source-toolkit/)
- **Tags**: sdd, spec-driven, planning, requirements, prd, ai-agents

---

## Prompts

*No prompts added yet.*

<!-- Example entry:
### Code Review Prompt
- **Path**: `prompts/code-review.md`
- **Description**: System prompt for thorough code reviews
- **Tags**: review, quality
-->

---

## MCP Servers

*No MCP servers added yet.*

<!-- Example entry:
### GitHub MCP
- **Path**: `mcp-servers/github.json`
- **Description**: GitHub integration for issues, PRs, and repo management
- **Tags**: github, integration
-->

---

## Skills

*No skills added yet.*

<!-- Example entry:
### /deploy
- **Path**: `skills/deploy.md`
- **Description**: Deploy to staging or production
- **Tags**: deployment, devops
-->

---

## Hooks

*No hooks added yet.*

<!-- Example entry:
### Pre-commit Lint
- **Path**: `hooks/pre-commit-lint.sh`
- **Description**: Run linter before commits
- **Tags**: linting, quality
-->

---

## Templates

*No templates added yet.*

<!-- Example entry:
### TypeScript Project
- **Path**: `templates/typescript-project.md`
- **Description**: CLAUDE.md template for TypeScript projects
- **Tags**: typescript, template
-->
