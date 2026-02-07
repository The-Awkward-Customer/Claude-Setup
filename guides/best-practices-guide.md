# Claude Code Best Practices Learning Guide

A guide to help you understand and apply concepts from the [claude-code-best-practice](https://github.com/shanraisshan/claude-code-best-practice) repo.

**Working Examples**: See [`examples/`](../examples/) for testable examples of each concept.

---

## Your Current Setup vs. Best Practices

| Concept | Best Practice | Your Setup | Status |
|---------|---------------|------------|--------|
| **CLAUDE.md** | <150 lines, concise | Multiple project-specific files | Good |
| **Skills** | Progressive disclosure | `/shop` skill created | Started |
| **Hooks** | Automation via PreToolUse/PostToolUse | Documented, none implemented | Ready |
| **MCP Servers** | External tool connections | Pencil, Firecrawl, Figma, Playwright | Active |
| **Subagents** | Feature-specific, not role-based | Not yet configured | To learn |
| **Rules** | `.claude/rules/*.md` for topic-specific guidance | Not configured | To learn |
| **Plugins** | Distributable bundles | /local-review, /yc-advisor installed | Active |

---

## Core Concepts Explained

### 1. CLAUDE.md (Memory)
**What**: Project context file loaded every session
**Best Practice**: Keep under 150 lines
**Your Setup**: `claude-setup/CLAUDE.md` is well-structured at ~145 lines

**Key Insight**: CLAUDE.md is "memory" - persistent context. Don't bloat it.

---

### 2. Skills (Progressive Disclosure)
**What**: Reusable workflows invoked via `/skill-name`
**Location**: `.claude/skills/` (project) or `~/.claude/skills/` (global)

**Structure**:
```markdown
---
description: Short description shown in /help
---
# Instructions loaded only when invoked
```

**Key Insight**: Skills load on-demand (~100 tokens metadata, full content only when used). This is "progressive disclosure" - showing information only when needed.

**Your Example**: `/shop` skill in `claude-setup/skills/shop.md`

**Try It**: See [`examples/skills/hello.md`](../examples/skills/hello.md) for a minimal working example.

---

### 3. Hooks (Deterministic Automation)
**What**: Scripts that run outside Claude's agentic loop on specific events
**Events**: `PreToolUse`, `PostToolUse`, `Notification`, `Stop`, `UserPromptSubmit`, `SessionStart`

**Example - Auto-format after edits**:
```json
{
  "hooks": {
    "PostToolUse": [{
      "matcher": "Edit",
      "hooks": [{ "type": "command", "command": ".claude/hooks/format.sh" }]
    }]
  }
}
```

**Key Insight**: Hooks are DETERMINISTIC (always run) vs. Claude which is probabilistic. Use for:
- Blocking dangerous operations (exit code 2)
- Auto-formatting code
- Creating auto-commits
- Enforcing team conventions

**Resources**:
- [Hooks Reference](https://code.claude.com/docs/en/hooks)
- [Claude Code Hooks Mastery](https://github.com/disler/claude-code-hooks-mastery)

**Try It**: See [`examples/hooks/`](../examples/hooks/) for working format and block examples.

---

### 4. MCP Servers (External Tools)
**What**: Model Context Protocol - connects Claude to external tools/APIs
**Locations**: `.mcp.json` (project), `~/.claude.json` (global)

**Your Active MCPs**:
- Pencil (design editor)
- Firecrawl (web scraping)
- Figma (design-to-code)
- Playwright (browser automation)

**Key Insight**: MCP tools consume context. Use Tool Search when you have many servers - it loads tools on-demand instead of preloading all.

**Resources**: [MCP Docs](https://code.claude.com/docs/en/mcp)

**Try It**: See [`examples/mcp/example-mcp.json`](../examples/mcp/example-mcp.json) for a minimal config.

---

### 5. Subagents (Isolated Execution)
**What**: Specialized agents with their own context window, tools, and permissions
**Location**: `.claude/agents/`

**Best Practice**: Create FEATURE-SPECIFIC agents, NOT role-based (QA, backend)

**Example Structure**:
```markdown
# agent-name.md
---
description: When to use this agent
tools: [Edit, Read, Bash]
---
Instructions for this agent...
```

**Key Insight**: Subagents run in ISOLATION. They return summarized results. Use for:
- Parallelizable tasks
- Tasks needing restricted tool access
- Independent workflows

**Resources**: [Subagents Docs](https://code.claude.com/docs/en/sub-agents)

**Try It**: See [`examples/agents/file-organizer.md`](../examples/agents/file-organizer.md) for a feature-specific agent.

---

### 6. Rules (Topic-Specific Instructions)
**What**: Scoped instructions in `.claude/rules/*.md`
**Feature**: Can be path-scoped (apply only to certain files)

**Example**:
```markdown
# .claude/rules/testing.md
---
globs: ["**/*.test.ts", "**/*.spec.ts"]
---
When writing tests:
- Use vitest not jest
- Mock external APIs
```

**Key Insight**: Rules differ from CLAUDE.md - they're topic-specific and can be path-scoped.

**Try It**: See [`examples/rules/`](../examples/rules/) for testing and API convention examples.

---

### 7. Context Engineering
**What**: Optimizing Claude's input since LLMs are stateless

**The "Dumb Zone"**: Too much irrelevant context = degraded performance

**Techniques**:
- Keep CLAUDE.md <150 lines
- Use progressive disclosure (Skills)
- Use subagents for context isolation
- Compact manually when >50% context used
- Keep subtasks small enough for <50% context completion

---

## The "Holy Trinity" Pattern

```
Command -> Agent -> Skills
```

| Component | Role | Example |
|-----------|------|---------|
| Command | Entry point | `/weather` |
| Agent | Orchestrator with preloaded skills | weather-agent |
| Skills | Domain knowledge | weather-fetcher, weather-transformer |

**Benefits**: Clean separation, reusability, progressive disclosure

**Try It**: See [`examples/holy-trinity/`](../examples/holy-trinity/) for a complete working pattern with `/greet`.

---

## Quick Reference: File Locations

| Type | Project | Global |
|------|---------|--------|
| CLAUDE.md | `./CLAUDE.md` | N/A |
| Settings | `.claude/settings.json` | `~/.claude/settings.json` |
| Skills | `.claude/skills/` | `~/.claude/skills/` |
| Rules | `.claude/rules/` | N/A |
| MCP | `.mcp.json` | `~/.claude.json` |
| Agents | `.claude/agents/` | N/A |
| Hooks | In settings.json | In settings.json |

---

## Recommended Learning Path

Use the [`examples/`](../examples/) directory to learn hands-on.

### Phase 1: Foundation (You're Here)
- [x] Understand CLAUDE.md structure
- [x] Know what Skills are
- [ ] Read your `/shop` skill to understand the format
- [ ] Try the [`examples/skills/hello.md`](../examples/skills/hello.md) example

### Phase 2: Automation
- [ ] Create a simple PostToolUse hook (auto-format) - see [`examples/hooks/`](../examples/hooks/)
- [ ] Create a PreToolUse hook (block dangerous paths)
- [ ] Add path-scoped rules - see [`examples/rules/`](../examples/rules/)

### Phase 3: Advanced
- [ ] Create a feature-specific subagent - see [`examples/agents/`](../examples/agents/)
- [ ] Implement the Command->Agent->Skills pattern - see [`examples/holy-trinity/`](../examples/holy-trinity/)

---

## Key Takeaways from Best Practices Repo

1. **Vanilla > Complex** - Simple Claude Code outperforms fragmented complex workflows
2. **Commit Often** - Commit immediately after task completion
3. **Plan First** - Always begin with plan mode
4. **Context is King** - Keep context lean, use progressive disclosure
5. **Feature-Specific** - Agents should be feature-specific, not role-based
6. **Hooks are Deterministic** - Use them for things that MUST happen

---

## Sources

- [Claude Code Best Practice Repo](https://github.com/shanraisshan/claude-code-best-practice)
- [Hooks Reference](https://code.claude.com/docs/en/hooks)
- [MCP Docs](https://code.claude.com/docs/en/mcp)
- [Subagents Docs](https://code.claude.com/docs/en/sub-agents)
- [Progressive Disclosure for AI Coding Tools](https://alexop.dev/posts/stop-bloating-your-claude-md-progressive-disclosure-ai-coding-tools/)
- [Claude Skills Deep Dive](https://leehanchung.github.io/blogs/2025/10/26/claude-skills-deep-dive/)
- [Claude Code Hooks Mastery](https://github.com/disler/claude-code-hooks-mastery)
