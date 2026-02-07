# Holy Trinity Pattern Example

This example demonstrates the **Command -> Agent -> Skills** pattern, also known as the "Holy Trinity" of Claude Code architecture.

## The Pattern

```
/greet (Command) → greet-agent (Orchestrator) → greeting-formatter (Domain Skill)
```

| Component | File | Role |
|-----------|------|------|
| Command | `greet.md` | Entry point invoked by user |
| Agent | `greet-agent.md` | Orchestrator with preloaded skills |
| Domain Skill | `greeting-formatter.md` | Specialized knowledge |

## Why This Pattern?

### Benefits

1. **Separation of Concerns**
   - Command: User interface
   - Agent: Orchestration logic
   - Skills: Domain knowledge

2. **Reusability**
   - `greeting-formatter` can be used by other agents
   - Pattern can be replicated for other features

3. **Progressive Disclosure**
   - Only the command description loads initially
   - Full agent/skill content loads when needed

4. **Isolated Context**
   - Agent runs in its own context window
   - Doesn't pollute the main conversation

## Installation

```bash
# 1. Install the command (entry point)
mkdir -p ~/.claude/skills
cp greet.md ~/.claude/skills/

# 2. Install the agent (project-level)
mkdir -p .claude/agents
cp greet-agent.md .claude/agents/

# 3. Install the domain skill (can be global or project)
cp greeting-formatter.md ~/.claude/skills/
```

## Usage

```
/greet Alice
```

### What Happens

1. User runs `/greet Alice`
2. `greet.md` skill is loaded
3. Skill spawns `greet-agent` subagent with the name "Alice"
4. Agent uses `greeting-formatter` skill to format the greeting
5. Agent returns the formatted greeting
6. User sees the result

## Adapting This Pattern

To create your own Holy Trinity:

1. **Identify the feature** (e.g., "deployment")
2. **Create the command** (`/deploy`) - handles user input
3. **Create the agent** (`deploy-agent`) - orchestrates the workflow
4. **Create domain skills** (`env-validator`, `deployment-runner`) - specialized tasks

### Template

```
/your-command → your-agent → domain-skill-1
                           → domain-skill-2
                           → domain-skill-3
```

## Files in This Example

- `greet.md` - The `/greet` command
- `greet-agent.md` - The orchestrator agent
- `greeting-formatter.md` - The domain skill
- `README.md` - This explanation
