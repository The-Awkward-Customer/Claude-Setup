# Best Practices Examples

Working examples for each concept in the [best practices guide](../guides/best-practices-guide.md). Each example is self-contained and testable.

## Quick Start

| Example | What It Shows | Test It |
|---------|---------------|---------|
| [Skills](#skills) | Minimal `/hello` skill | Run `/hello` |
| [Hooks](#hooks) | Auto-format + block patterns | Edit a file |
| [Rules](#rules) | Path-scoped instructions | Write a test file |
| [Agents](#agents) | Feature-specific subagent | Call file-organizer |
| [MCP](#mcp) | Minimal server config | Load tools |
| [Holy Trinity](#holy-trinity) | Complete pattern | Run `/greet Alice` |

---

## Skills

**Location**: `examples/skills/`

### hello.md - Minimal Skill

A minimal skill demonstrating the basic structure:
- YAML frontmatter with description
- Instructions loaded only when invoked

**Install**:
```bash
cp examples/skills/hello.md ~/.claude/skills/hello.md
```

**Test**:
```
/hello
```

**Expected**: Claude responds with "Hello! I'm working correctly."

---

## Hooks

**Location**: `examples/hooks/`

Hooks are shell scripts that run outside Claude's agentic loop. They're **deterministic** - they always run when triggered.

### format-on-edit.sh - PostToolUse Hook

Automatically runs Prettier after the Edit tool modifies a file.

**Install**:
1. Copy the script:
   ```bash
   mkdir -p .claude/hooks
   cp examples/hooks/format-on-edit.sh .claude/hooks/
   chmod +x .claude/hooks/format-on-edit.sh
   ```
2. Add to `.claude/settings.json` (see `settings-snippet.json`)

**Test**: Edit any `.js`, `.ts`, `.json`, or `.md` file. It should auto-format.

### block-secrets.sh - PreToolUse Hook

Blocks edits to sensitive files by exiting with code 2.

**Install**:
1. Copy the script:
   ```bash
   cp examples/hooks/block-secrets.sh .claude/hooks/
   chmod +x .claude/hooks/block-secrets.sh
   ```
2. Add to `.claude/settings.json` (see `settings-snippet.json`)

**Test**: Try to edit `.env` - Claude should be blocked.

### settings-snippet.json

Ready-to-copy configuration for both hooks.

**Usage**: Merge this into your `.claude/settings.json`.

---

## Rules

**Location**: `examples/rules/`

Rules provide topic-specific instructions that can be path-scoped.

### testing.md - Path-Scoped Rule

Applies only to test files (`*.test.ts`, `*.spec.ts`).

**Install**:
```bash
mkdir -p .claude/rules
cp examples/rules/testing.md .claude/rules/
```

**Test**: Ask Claude to write a test file. It should:
- Use Vitest, not Jest
- Follow AAA pattern
- Mock external APIs

### api-conventions.md - Global Rule

Applies to all API-related work (no path scope).

**Install**:
```bash
cp examples/rules/api-conventions.md .claude/rules/
```

**Test**: Ask Claude to create an API endpoint. It should follow REST conventions.

---

## Agents

**Location**: `examples/agents/`

### file-organizer.md - Feature-Specific Agent

A subagent that organizes imports in TypeScript/JavaScript files.

**Key Features**:
- Restricted tools (only Read, Edit)
- Isolated context
- Single responsibility

**Install**:
```bash
mkdir -p .claude/agents
cp examples/agents/file-organizer.md .claude/agents/
```

**Test**:
```
Use the file-organizer agent on src/messy-file.ts
```

The agent should sort and group imports without touching other code.

---

## MCP

**Location**: `examples/mcp/`

### example-mcp.json - Minimal MCP Config

Shows the minimal configuration for an MCP server (filesystem access).

**Install** (project-level):
```bash
# Add to .mcp.json in project root
cat examples/mcp/example-mcp.json
```

**Install** (global):
```bash
# Merge into ~/.claude.json mcpServers section
```

**Test**: After restarting Claude Code, filesystem tools should be available.

---

## Holy Trinity

**Location**: `examples/holy-trinity/`

The complete Command -> Agent -> Skills pattern demonstrating how all pieces work together.

```
/greet → greet-agent → greeting-formatter skill
```

### Files

| File | Role |
|------|------|
| `greet.md` | Entry skill (the `/greet` command) |
| `greet-agent.md` | Orchestrator agent with preloaded skills |
| `greeting-formatter.md` | Domain skill for formatting greetings |
| `README.md` | Pattern explanation |

### Install

```bash
# Install the skill (entry point)
cp examples/holy-trinity/greet.md ~/.claude/skills/

# Install the agent
mkdir -p .claude/agents
cp examples/holy-trinity/greet-agent.md .claude/agents/

# Install the domain skill (used by agent)
cp examples/holy-trinity/greeting-formatter.md ~/.claude/skills/
```

### Test

```
/greet Alice
```

**Expected Flow**:
1. `/greet` skill invoked
2. Skill spawns `greet-agent`
3. Agent uses `greeting-formatter` skill
4. Returns personalized greeting

---

## File Reference

```
examples/
├── README.md                    # This file
├── skills/
│   └── hello.md                 # Minimal skill
├── hooks/
│   ├── format-on-edit.sh        # PostToolUse: auto-format
│   ├── block-secrets.sh         # PreToolUse: block .env edits
│   └── settings-snippet.json    # Config for settings.json
├── rules/
│   ├── testing.md               # Path-scoped testing rules
│   └── api-conventions.md       # Global API conventions
├── agents/
│   └── file-organizer.md        # Feature-specific agent
├── mcp/
│   └── example-mcp.json         # Minimal MCP config
└── holy-trinity/
    ├── README.md                # Pattern explanation
    ├── greet.md                 # Entry skill
    ├── greet-agent.md           # Orchestrator agent
    └── greeting-formatter.md    # Domain skill
```

---

## Learn More

- [Best Practices Guide](../guides/best-practices-guide.md) - Full explanation of each concept
- [Claude Code Docs](https://code.claude.com/docs) - Official documentation
- [claude-code-best-practice](https://github.com/shanraisshan/claude-code-best-practice) - Source repo
