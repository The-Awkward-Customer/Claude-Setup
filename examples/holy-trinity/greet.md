---
description: Greet someone with a personalized message (Holy Trinity example)
---

# /greet

A command that demonstrates the Holy Trinity pattern: Command -> Agent -> Skills.

## Usage

```
/greet <name>
```

## Instructions

When the user runs `/greet <name>`:

1. **Extract the name** from the user's input
   - If no name provided, ask for one

2. **Spawn the greet-agent** to handle the greeting
   - Pass the name to the agent
   - The agent will use the `greeting-formatter` skill

3. **Return the result** from the agent

## Example

User runs: `/greet Alice`

You should:
1. Note the name is "Alice"
2. Use the Task tool to spawn the `greet-agent`:
   ```
   Task: "Generate greeting for Alice"
   Agent: greet-agent
   Prompt: "Generate a personalized greeting for: Alice"
   ```
3. Return whatever the agent produces

## Why This Pattern?

This skill demonstrates how a simple command can delegate to a specialized agent, which in turn uses domain-specific skills. This separation allows:

- The command to stay simple (just parse input and delegate)
- The agent to handle complex orchestration
- Domain skills to be reusable across different agents

See `examples/holy-trinity/README.md` for the full explanation.
