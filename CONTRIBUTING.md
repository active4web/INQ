# Contributing to TalentOS

## Quick start
```bash
pnpm install --frozen-lockfile
pnpm check     # tsc --noEmit
pnpm test
pnpm dev
```

## Commit conventions

Conventional Commits — keep the history machine-readable:
- `feat(scope):`, `fix(scope):`, `chore(scope):`, `docs(scope):`, `test(scope):`
- BREAKING changes go in the footer: `BREAKING CHANGE: ...`

## Code rules

### Backend (tRPC + Drizzle)
- All write procedures must be wrapped in role/type middleware from `server/_core/authz.ts`:
  `adminOnly`, `employerOnly`, `devOnly`, or build with `requireRole(...)`.
- All input must go through a Zod schema — no raw `z.any()` in production code.
- Never `console.log` — use `logger` from `server/_core/logger.ts`.
- Database access only through `getDb()` + Drizzle query builder. No raw SQL string concatenation.
- Procedures that mutate user data should write to `auditLogs`.

### Frontend
- Pages use `lazy()` for code-splitting.
- Forms use React Hook Form + `zodResolver` of the shared schema (re-export from `shared/`).
- Never `dangerouslySetInnerHTML` with user-supplied content (escape first).
- Use `<ProtectedRoute roles={[...]}>` for client-side guards. Backend re-checks every time.

### Tests
- Write a router test for every new procedure: at minimum, one happy path + one RBAC denial.
- Use `vi.mock("../db", ...)` to isolate from a real database.

## PR checklist

- [ ] `pnpm check` passes (0 errors)
- [ ] `pnpm test` passes
- [ ] `pnpm audit --prod` shows no new high/critical
- [ ] Added/updated tests
- [ ] Updated `SECURITY_IMPLEMENTATION.md` if security surface changed
- [ ] Conventional Commit title
