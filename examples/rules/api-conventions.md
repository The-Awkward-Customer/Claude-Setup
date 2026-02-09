# API Conventions

Rules for creating and working with API endpoints.

## REST Conventions

Follow RESTful patterns:

| Action | Method | Path | Example |
|--------|--------|------|---------|
| List | GET | `/resources` | `GET /users` |
| Get one | GET | `/resources/:id` | `GET /users/123` |
| Create | POST | `/resources` | `POST /users` |
| Update | PUT | `/resources/:id` | `PUT /users/123` |
| Partial | PATCH | `/resources/:id` | `PATCH /users/123` |
| Delete | DELETE | `/resources/:id` | `DELETE /users/123` |

## Response Format

Always return consistent JSON structure:

```typescript
// Success response
{
  "data": { ... },
  "meta": { "timestamp": "...", "requestId": "..." }
}

// Error response
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Email is required",
    "details": [...]
  }
}
```

## Status Codes

Use appropriate HTTP status codes:

| Code | Use Case |
|------|----------|
| 200 | Success (with data) |
| 201 | Created |
| 204 | Success (no content) |
| 400 | Bad request (validation) |
| 401 | Unauthorized |
| 403 | Forbidden |
| 404 | Not found |
| 500 | Server error |

## Validation

- Validate all inputs at the API boundary
- Return 400 with specific error messages
- Use a validation library (Zod, Yup)

```typescript
const schema = z.object({
  email: z.string().email(),
  name: z.string().min(1).max(100)
})

const result = schema.safeParse(req.body)
if (!result.success) {
  return res.status(400).json({
    error: {
      code: 'VALIDATION_ERROR',
      message: 'Invalid input',
      details: result.error.issues
    }
  })
}
```

## Error Handling

- Never expose internal errors to clients
- Log full errors server-side
- Return safe error messages to clients

```typescript
try {
  // ... operation
} catch (error) {
  logger.error('Operation failed', { error, requestId })
  return res.status(500).json({
    error: {
      code: 'INTERNAL_ERROR',
      message: 'An unexpected error occurred'
    }
  })
}
```
