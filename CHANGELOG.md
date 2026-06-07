# Changelog

## v1.1.0 — Refactor Pass

### 🔐 Security
- **NEW** `_core/authz.ts` — role/type middleware (`requireRole`, `adminOnly`, `employerOnly`, `devOnly`)
- **Fixed** RBAC gap in `employer.confirmAndCreateJob` (was: TODO comment)
- **NEW** ownership check in `getBlindMatchedCandidates` + `acceptCandidate` — companies can no longer touch jobs they didn't post

### 🐛 Fixes
- **Fixed** `tsc --noEmit`: 16 errors → 0
  - Missing `server/routers/admin.ts` — implemented all 9 procedures expected by `admin.test.ts`
  - Narrowed `useState<string>` to literal unions in admin pages
  - Renamed mismatched fields (`notes` → `note`, `durationDays` → `days`)
  - Added missing `contentType` filter to `admin.moderationFlags`
- **Extended** admin router with stats fields (`newUsersLast30Days`, `avgApplicationsPerJob`, etc.) expected by `AdminAnalyticsPage`

### 🧹 Cleanup
- **NEW** `_core/logger.ts` — structured JSON logger with redaction (replaces 10 files' worth of `console.*`)
- **Removed** unused dependencies: `@stripe/*`, `stripe`, `@aws-sdk/client-s3`, `@aws-sdk/s3-request-presigner` (~5MB)

### 🧪 Tests
- **NEW** `server/routers/employer.test.ts` — 5 tests covering RBAC denial + happy path

### 🛠️ DevOps
- **NEW** `.github/workflows/ci.yml` — typecheck + test + audit + build on every PR
- **NEW** `Dockerfile` (multi-stage, non-root user, healthcheck)
- **NEW** `docker-compose.yml` (MySQL + app with health-gated startup)

### 📚 Docs
- **NEW** `CONTRIBUTING.md` — code rules, PR checklist, conventional commits
- **NEW** `RUNBOOK.md` — health checks, on-call SOPs, common ops
- **NEW** `CHANGELOG.md` — this file

### Stats
- `tsc --noEmit` errors: **16 → 0**
- Server files using `console.*`: **10 → 0**
- Dead dependencies: **5 removed**
- Router tests: **3 → 5** (+ 2 RBAC tests for admin via employer.test.ts)

---

## v1.2.0 — Icons namespace + ESLint

### 🎨 Icons
- **NEW** `client/src/components/ui/icons.tsx` — single source of truth for all icons (60 entries)
  - `createIcon` wrapper enforces size 24, `currentColor`, `aria-hidden`
  - Add new icons by extending `iconMap` only (one import + one entry)
- **Migrated** 54 files via codemod — zero direct `lucide-react` imports outside `icons.tsx`

### 🛡️ Lint
- **NEW** `.eslintrc.cjs` — `no-restricted-imports` blocks `lucide-react`, `@tabler/icons-react`, `@phosphor-icons/react`
- **NEW** `pnpm lint` script
- **NEW** ESLint dev-deps (`@typescript-eslint/parser`, `@typescript-eslint/eslint-plugin`)

### 🧪 Tests
- **NEW** `icons.test.tsx` — covers defaults + overrides + map stability

### Stats
- tsc errors: still **0** ✅
- Files importing `lucide-react` directly: **54 → 1** (only `icons.tsx`)
- New ESLint rule blocks regression at PR time

---

## v1.3.0 — UI/UX Pro Max pass

### ♿ Accessibility
- **NEW** Skip-to-content link (`App.tsx` + `index.css` styles)
- **NEW** `prefers-reduced-motion` honored globally
- **NEW** `tabular-nums` on stat displays (no number jitter on counters)

### 📱 Mobile / viewport
- Replaced `min-h-screen` / `h-screen` / `100vh` with `min-h-dvh` / `h-dvh` / `100dvh` across 10 files (fixes mobile Safari address-bar issue)

### 🖱️ Interaction
- `Button` base now has `active:scale-[0.97]` — instant press feedback on every variant

### 📝 Documentation
- **NEW** `UI_UX_AUDIT.md` — full design audit + open items + next-3-sprint plan

### Stats
- tsc errors: still **0** ✅
- Files affected: 13
- New CSS rules: 3 (skip-link, reduced-motion, tabular)

---

## v1.4.0 — Cloudflare deploy-ready

### 🚀 Deployment
- **NEW** `client/public/_redirects` — SPA fallback + commented `/api/*` Workers proxy template
- **NEW** `client/public/_headers` — CSP, HSTS, X-Frame, Permissions-Policy + immutable cache for `/assets/*`
- **NEW** `wrangler.toml` — Pages config + commented Workers/Hyperdrive/D1 blocks
- **NEW** `.github/workflows/deploy-cloudflare.yml` — auto-deploy on push to main + preview URLs for PRs
- **NEW** `DEPLOY_CLOUDFLARE.md` — full guide for both Pages-only and Pages+Workers paths

### 📦 Scripts
- `pnpm build:client` — Vite build only (no server bundle)
- `pnpm preview:cf`   — local preview using Wrangler at :8788
- `pnpm deploy:pages`   — push current build to production branch
- `pnpm deploy:preview` — push to preview branch

### Verified
- `vite build` → `dist/public/` includes `_headers` + `_redirects` (auto-copied from `client/public/`)
- 0 tsc errors before and after

---

## v1.5.0 — Workers backend ready

### 🌐 Backend on Cloudflare Workers
- **NEW** `server/worker.ts` — wraps `appRouter` with `@trpc/server/adapters/fetch.fetchRequestHandler`
  - Zero router changes — same tRPC procedures, same types
  - CORS preflight + per-request `corsHeaders` with `CORS_ORIGIN` env
  - `/health` endpoint built-in
  - `Env` interface exposes bindings: `DB`, `SESSIONS`, secrets

### ⚙️ Build & deploy
- **NEW** `wrangler.worker.toml` — separate config for Workers (Pages stays in `wrangler.toml`)
- **NEW** `tsconfig.worker.json` — scoped include (excludes Express entry, vite, tests)
- **NEW** scripts:
  - `pnpm build:worker`    → esbuild bundle → `dist-worker/worker.js`
  - `pnpm dev:worker`      → `wrangler dev` locally on :8787
  - `pnpm deploy:worker`   → build + `wrangler deploy`

### 🔁 Frontend → Backend wiring
- `client/public/_redirects` now proxies `/api/*` → `https://talentos-api.workers.dev/:splat`
- Same origin from the Pages site → **no CORS**

### 🛠️ CI
- `.github/workflows/deploy-cloudflare.yml` now has **two jobs**: pages + worker
- Worker deploys only from `main` (Pages still gives preview URLs for every PR)

### 📚 Docs
- `DEPLOY_CLOUDFLARE.md` rewritten — 3-stage flow with the exact Wrangler commands for: Hyperdrive (MySQL proxy) or D1 (SQLite), KV sessions, and secret-put.

### Notes for the dev migrating to Workers
- `server/_core/index.ts` (Express entry) is **excluded** from `tsconfig.worker.json` — Node Express stays available for legacy deploys.
- Existing routers use `getDb()` which works with `mysql2`. To run on Workers you must switch DB driver:
  - **Hyperdrive**: keep mysql, configure binding in `wrangler.worker.toml`
  - **D1**: convert `drizzle/schema.ts` → sqlite tables; re-gen migrations.
- `ctx.req` / `ctx.res` in routers are typed as Express but only used for cookies (auth). Set cookies via `responseMeta` in the worker when wiring real auth.

---

## v1.5.1 — Workers build fix

### 🐛 Fixed
- **`server/worker.ts`** — corrected import path: `"../routers"` → `"./routers"` (both files live in `/server/`).
- **Node built-in imports** — 5 files now use `node:` prefix (`crypto`, `fs`, `http`, `net`, `path`) for Workers `nodejs_compat` mode:
  - `server/_core/blindMatching.ts`
  - `server/_core/encryption.ts`
  - `server/_core/securityHeaders.ts`
  - `server/_core/index.ts`
  - `server/_core/vite.ts`

### ✅ Verified
- `esbuild server/worker.ts --bundle --external:node:* --external:mysql2 --external:drizzle-orm/mysql2` → bundles successfully to **794 KB**.
- Build command exactly matches `pnpm build:worker` in `package.json`.
