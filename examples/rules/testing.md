---
globs: ["**/*.test.ts", "**/*.spec.ts", "**/*.test.tsx", "**/*.spec.tsx"]
---

# Testing Rules

These rules apply when working with test files.

## Test Framework

Use **Vitest**, not Jest:

```typescript
import { describe, it, expect, vi } from 'vitest'
```

## Test Structure

Follow the AAA pattern:

```typescript
it('should do something', () => {
  // Arrange - set up test data
  const input = 'test'

  // Act - perform the action
  const result = processInput(input)

  // Assert - verify the outcome
  expect(result).toBe('expected')
})
```

## Naming Conventions

- Test files: `*.test.ts` or `*.spec.ts`
- Describe blocks: Use the function/component name
- It blocks: Start with "should"

```typescript
describe('UserService', () => {
  describe('createUser', () => {
    it('should create a user with valid input', () => {})
    it('should throw when email is invalid', () => {})
  })
})
```

## Mocking

- Mock external APIs and services
- Use `vi.mock()` for module mocks
- Use `vi.fn()` for function mocks
- Reset mocks between tests with `beforeEach`

```typescript
vi.mock('./api', () => ({
  fetchUser: vi.fn()
}))

beforeEach(() => {
  vi.clearAllMocks()
})
```

## Assertions

- Use specific matchers (`toBe`, `toEqual`, `toContain`)
- Avoid `toBeTruthy`/`toBeFalsy` when more specific options exist
- Test error cases with `toThrow`

```typescript
expect(result).toEqual({ id: 1, name: 'Test' })  // Good
expect(!!result).toBe(true)                       // Avoid
```
