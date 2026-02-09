# Tools Catalog

Browse available tools by category. Each entry includes a description and file path.

## Quick Index

| Category | Count | Jump |
|----------|-------|------|
| Plugins | 2 | [→ Plugins](#plugins-installed) |
| MCP Servers | 4 | [→ MCP Servers](#mcp-servers) |
| External Tools | 2 | [→ External Tools](#external-tools) |
| Prompts | 0 | [→ Prompts](#prompts) |
| Skills | 1 | [→ Skills](#skills) |
| Hooks | 0 | [→ Hooks](#hooks) |
| Templates | 0 | [→ Templates](#templates) |
| Guides | 1 | [→ Guides](#guides) |
| Examples | 6 | [→ Examples](#examples) |

**Total**: 16 items available

### Tools at a Glance

| Tool | Type | Status |
|------|------|--------|
| /local-review | Plugin | [ALWAYS] |
| /yc-advisor | Plugin | [SPECIFIC] |
| Pencil MCP | MCP Server | [ACTIVE] |
| Firecrawl MCP | MCP Server | [ACTIVE] |
| Figma Plugin | MCP Server | [ACTIVE] |
| Playwright Plugin | MCP Server | [ACTIVE] |
| Beads | External Tool | [EXPERIMENTAL] |
| GitHub Spec Kit | External Tool | [EXPERIMENTAL] |
| /shop | Skill | [ALWAYS] |
| Best Practices Guide | Guide | [REFERENCE] |
| Skills Example | Example | [LEARNING] |
| Hooks Examples | Example | [LEARNING] |
| Rules Examples | Example | [LEARNING] |
| Agent Example | Example | [LEARNING] |
| MCP Config Example | Example | [LEARNING] |
| Holy Trinity Example | Example | [LEARNING] |

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

Model Context Protocol servers that extend Claude Code with additional capabilities.

### Pencil MCP
**Status: [ACTIVE]**

- **Type**: Standalone Application
- **Description**: Design editor for `.pen` files - create and edit web/mobile application designs with AI assistance
- **Install**: Download [Pencil](https://www.pencil.com/) application for macOS
- **Configuration** (in `~/.claude.json`):
  ```json
  "mcpServers": {
    "pencil": {
      "command": "/Applications/Pencil.app/Contents/Resources/app.asar.unpacked/out/mcp-server-darwin-arm64",
      "args": ["--ws-port", "62347"],
      "type": "stdio"
    }
  }
  ```
- **Key Tools**:
  - `get_editor_state` - Get current editor state and active file
  - `batch_get` - Search and retrieve design nodes
  - `batch_design` - Insert, update, delete, copy design elements
  - `get_screenshot` - Visual validation of designs
  - `get_guidelines` - Design rules for code/table/tailwind/landing-page
  - `get_style_guide` - Get style inspiration for design tasks
- **Tags**: design, ui, prototyping, pen-files

### Firecrawl MCP
**Status: [ACTIVE]**

- **Type**: npm package
- **Description**: Web scraping, crawling, and content extraction using [Firecrawl](https://firecrawl.dev)
- **Install**:
  ```bash
  # Get API key from https://firecrawl.dev
  ```
- **Configuration** (in `~/.claude.json`):
  ```json
  "mcpServers": {
    "firecrawl": {
      "command": "npx",
      "args": ["-y", "firecrawl-mcp"],
      "env": {
        "FIRECRAWL_API_KEY": "your-api-key"
      }
    }
  }
  ```
- **Key Tools**:
  - `firecrawl_scrape` - Extract content from a single URL
  - `firecrawl_crawl` - Crawl entire websites
  - `firecrawl_search` - Search the web with AI
  - `firecrawl_map` - Map site structure
  - `firecrawl_extract` - Structured data extraction
- **Tags**: web-scraping, crawling, data-extraction, search

### Figma Plugin
**Status: [ACTIVE]**

- **Type**: Built-in Claude Code Plugin
- **Description**: Figma design integration for implementing designs and managing code connections
- **Install**: Automatically available in Claude Code with Figma Desktop
- **Configuration** (auto-configured when Figma is detected):
  ```json
  "mcpServers": {
    "figma-desktop": {
      "type": "http",
      "url": "http://127.0.0.1:3845/mcp"
    }
  }
  ```
- **Key Tools**:
  - `get_design_context` - Extract design details from Figma selection
  - `get_screenshot` - Capture Figma design visuals
  - `get_variable_defs` - Get design tokens and variables
  - `get_code_connect_map` - View component-to-code mappings
  - `add_code_connect_map` - Link Figma components to code
- **Related Skills**: `/figma:implement-design`, `/figma:code-connect-components`
- **Tags**: figma, design-to-code, ui, components

### Playwright Plugin
**Status: [ACTIVE]**

- **Type**: Built-in Claude Code Plugin
- **Description**: Browser automation for testing, scraping, and interaction
- **Install**: Automatically available in Claude Code
- **Key Tools**:
  - `browser_navigate` - Navigate to URLs
  - `browser_click` - Click elements on page
  - `browser_fill_form` - Fill out forms
  - `browser_take_screenshot` - Capture page screenshots
  - `browser_snapshot` - Get accessibility tree snapshot
  - `browser_evaluate` - Run JavaScript in browser
  - `browser_network_requests` - Monitor network activity
- **Usage Notes**:
  - Tools are deferred - use `ToolSearch` to load before calling
  - Browser state persists across tool calls within session
- **Tags**: browser, automation, testing, scraping

---

## Skills

Custom slash commands for Claude Code.

### /shop
**Status: [ALWAYS]**

- **Path**: `skills/shop.md`
- **Description**: Browse and install tools from this catalog
- **Install**:
  ```bash
  # Create skills directory if needed
  mkdir -p ~/.claude/skills

  # Download the shop skill
  curl -o ~/.claude/skills/shop.md https://raw.githubusercontent.com/The-Awkward-Customer/Claude-Setup/main/skills/shop.md
  ```
- **Usage**:
  - `/shop` - Browse the full catalog
  - `/shop search <term>` - Search for tools
  - `/shop install <tool>` - Get installation instructions
- **Tags**: catalog, discovery, tools, install

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

---

## Guides

Learning resources and reference documentation.

### Best Practices Guide
**Status: [REFERENCE]**

- **Path**: `guides/best-practices-guide.md`
- **Description**: Comprehensive guide to Claude Code best practices based on the [claude-code-best-practice](https://github.com/shanraisshan/claude-code-best-practice) repository
- **Topics covered**:
  - CLAUDE.md structure and memory
  - Skills and progressive disclosure
  - Hooks for deterministic automation
  - MCP servers and external tools
  - Subagents for isolated execution
  - Rules for topic-specific instructions
  - Context engineering techniques
  - The "Holy Trinity" pattern (Command -> Agent -> Skills)
- **Includes**:
  - Your current setup vs. best practices comparison
  - Quick reference for file locations
  - Recommended learning path
- **Tags**: best-practices, learning, reference, claude-code

---

## Examples

Working examples for each best practice concept. Copy these to your project to learn and test.

**Full index**: See `examples/README.md` for detailed instructions and test procedures.

### Skills Example
**Status: [LEARNING]**

- **Path**: `examples/skills/hello.md`
- **Description**: Minimal `/hello` skill demonstrating frontmatter and instructions structure
- **Test**: Copy to `~/.claude/skills/`, run `/hello`
- **Tags**: skills, beginner, minimal

### Hooks Examples
**Status: [LEARNING]**

- **Path**: `examples/hooks/`
- **Description**: PostToolUse and PreToolUse hook examples
- **Files**:
  - `format-on-edit.sh` - Auto-format files after Edit tool
  - `block-secrets.sh` - Block edits to .env and sensitive files
  - `settings-snippet.json` - Ready-to-copy settings config
- **Test**: Copy scripts, add to settings.json, edit a file
- **Tags**: hooks, automation, security

### Rules Examples
**Status: [LEARNING]**

- **Path**: `examples/rules/`
- **Description**: Path-scoped and global rule examples
- **Files**:
  - `testing.md` - Path-scoped rules for test files (Vitest, AAA pattern)
  - `api-conventions.md` - Global API conventions (REST, error handling)
- **Test**: Copy to `.claude/rules/`, ask Claude to write tests or API endpoints
- **Tags**: rules, testing, api, conventions

### Agent Example
**Status: [LEARNING]**

- **Path**: `examples/agents/file-organizer.md`
- **Description**: Feature-specific subagent for organizing imports
- **Features**:
  - Restricted tools (Read, Edit only)
  - Single responsibility
  - Isolated context
- **Test**: Copy to `.claude/agents/`, invoke on a file with messy imports
- **Tags**: agents, subagents, imports, typescript

### MCP Config Example
**Status: [LEARNING]**

- **Path**: `examples/mcp/example-mcp.json`
- **Description**: Minimal MCP server configuration (filesystem access)
- **Usage**:
  - Project: Save as `.mcp.json`
  - Global: Merge into `~/.claude.json`
- **Tags**: mcp, configuration, filesystem

### Holy Trinity Example
**Status: [LEARNING]**

- **Path**: `examples/holy-trinity/`
- **Description**: Complete Command -> Agent -> Skills pattern demonstration
- **Files**:
  - `README.md` - Pattern explanation
  - `greet.md` - Entry command (`/greet`)
  - `greet-agent.md` - Orchestrator agent
  - `greeting-formatter.md` - Domain skill
- **Pattern Flow**: `/greet Alice` → `greet-agent` → `greeting-formatter`
- **Test**: Install all files, run `/greet Alice`
- **Tags**: holy-trinity, pattern, architecture, advanced
