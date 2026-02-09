---
description: Formats personalized greetings with various styles
---

# Greeting Formatter

A domain skill that formats personalized greetings.

## Purpose

This skill contains the **domain knowledge** for greeting formatting. It demonstrates the "Skills" role in the Holy Trinity pattern - specialized, reusable knowledge that can be used by any agent.

## Instructions

When asked to format a greeting for a name:

1. **Create a warm greeting** using this format:

```
Hello, {name}!

Welcome! It's wonderful to meet you. I hope you're having a fantastic day.

Best regards,
Claude
```

2. **Return the formatted greeting**

## Variations

You can vary the greeting based on context:

### Formal
```
Dear {name},

Thank you for reaching out. I'm pleased to assist you today.

Sincerely,
Claude
```

### Casual
```
Hey {name}!

Great to meet you! Let me know how I can help.

Cheers,
Claude
```

### Time-Aware
```
Good morning/afternoon/evening, {name}!

I hope this message finds you well.

Warm regards,
Claude
```

## Why a Separate Skill?

This skill is separate because:
1. **Reusability** - Other agents might need greeting formatting
2. **Single Responsibility** - This skill only handles formatting
3. **Testability** - Easy to test formatting in isolation
4. **Maintainability** - Update greeting templates in one place

In a real project, this might handle:
- Localization (greetings in different languages)
- Personalization (based on user preferences)
- Branding (company-specific greetings)
