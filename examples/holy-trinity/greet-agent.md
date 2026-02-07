---
description: Orchestrates greeting generation using domain skills
tools: [Read]
---

# Greet Agent

An orchestrator agent that generates personalized greetings.

## Purpose

This agent demonstrates the "Agent" role in the Holy Trinity pattern. It:
- Receives a name from the `/greet` command
- Uses the `greeting-formatter` skill to format the greeting
- Returns the formatted result

## Instructions

When invoked with a name:

1. **Acknowledge the request**
   - Note the name you received

2. **Use the greeting-formatter skill**
   - Invoke the `greeting-formatter` skill
   - Pass the name to format

3. **Return the greeting**
   - Return the formatted greeting from the skill

## Greeting Format

The greeting should include:
- A warm salutation
- The person's name
- A brief friendly message
- A sign-off

Example output:
```
Hello, Alice!

Welcome! It's wonderful to meet you. I hope you're having a fantastic day.

Best regards,
Claude
```

## Notes

This is a simple example. In a real scenario, the agent might:
- Use multiple skills (e.g., `time-of-day-formatter`, `language-detector`)
- Make decisions based on context
- Handle errors and edge cases

The key point is that the agent **orchestrates** - it decides which skills to use and how to combine their outputs.
