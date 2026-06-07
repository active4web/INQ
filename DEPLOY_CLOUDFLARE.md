# 🚀 Deploy to Cloudflare — Pages + Workers

This project is configured to deploy **both** the frontend (Pages) and the backend (Workers) to Cloudflare's global edge.

> One-time setup takes ~10 minutes. After that, every `git push origin main` deploys both.

---

## Quick start (3 stages)

### Stage 1 — Account + Wrangler CLI (one-time)
```bash
# 1) Sign up at https://dash.cloudflare.com/sign-up if you don't have an account
# 2) Install Wrangler globally
npm i -g wrangler@4

# 3) Browser-based OAuth — no API token to copy
wrangler login
```

### Stage 2 — Provision resources (one-time)
```bash
# Pages project for the frontend
wrangler pages project create talentos --production-branch main

# OPTION A — Hyperdrive proxy to your existing MySQL (zero schema change)
wrangler hyperdrive create talentos-db \
  --connection-string="mysql://USER:PASS@HOST:3306/talentos"
# Copy the printed ID into wrangler.worker.toml under [[hyperdrive]] -> id

# OPTION B — D1 (SQLite on the edge — requires Drizzle dialect change first)
wrangler d1 create talentos
# Copy the printed ID into wrangler.worker.toml under [[d1_databases]] -> database_id

# Sessions / refresh tokens
wrangler kv:namespace create SESSIONS
# Copy the printed ID into wrangler.worker.toml under [[kv_namespaces]] -> id

# Secrets (encrypted at rest)
wrangler secret put JWT_SECRET --config wrangler.worker.toml
wrangler secret put MANUS_API_KEY --config wrangler.worker.toml
```

### Stage 3 — Deploy (anytime)
```bash
# Build & deploy both
pnpm build:client && pnpm deploy:pages
pnpm deploy:worker

# Or push to main and let CI do it
git push origin main
```

---

## What's already wired

| File | Purpose |
|---|---|
| `server/worker.ts` | Workers entry — wraps `appRouter` with `fetchRequestHandler` (no router changes) |
| `wrangler.toml` | Pages config (`pages_build_output_dir = "dist/public"`) |
| `wrangler.worker.toml` | Workers config — bindings, vars, secrets placeholders |
| `tsconfig.worker.json` | Adds `@cloudflare/workers-types` lib for the worker build |
| `client/public/_redirects` | Pages routes `/api/*` → Workers, SPA fallback for the rest |
| `client/public/_headers` | CSP, HSTS, immutable cache for `/assets/*` |
| `.github/workflows/deploy-cloudflare.yml` | Auto-deploys both on push to `main`; PRs get preview URLs |

### npm scripts
```bash
pnpm build:client    # Vite build → dist/public/
pnpm build:worker    # esbuild bundle → dist-worker/worker.js
pnpm dev:worker      # local Workers dev server (http://localhost:8787)
pnpm deploy:pages    # push frontend to Cloudflare Pages
pnpm deploy:worker   # build + push Workers backend
pnpm preview:cf      # wrangler-served local preview of the built site
```

---

## Database — choose one

### A. Hyperdrive → MySQL (PlanetScale / RDS / DigitalOcean)
- **Pros:** zero schema change, existing data stays put, connection pooling on the edge.
- **Cons:** still costs cold-start to your origin region.
- **Config:** uncomment the `[[hyperdrive]]` block in `wrangler.worker.toml` and paste the ID.

### B. D1 (SQLite on the edge)
- **Pros:** lowest latency, no separate DB to manage, free-tier generous.
- **Cons:** SQLite ≠ MySQL — need to:
  1. Change `drizzle.config.ts` → `dialect: "sqlite"`
  2. Replace `mysqlTable`/`mysqlEnum` with `sqliteTable`/`text` in `drizzle/schema.ts`
  3. Re-generate migrations (`drizzle-kit generate`)
- **Config:** uncomment the `[[d1_databases]]` block in `wrangler.worker.toml`.

---

## Frontend → backend wiring

`client/public/_redirects`:
```
/api/*  https://talentos-api.workers.dev/:splat  200
/*      /index.html  200
```

This means the frontend calls `/api/trpc/...` and Pages proxies to the Worker — **same origin, no CORS**.

If you bind a custom domain to the Worker (e.g. `api.talentos.io`), update the redirect URL.

---

## CI/CD — GitHub Actions

`.github/workflows/deploy-cloudflare.yml` runs two jobs:

| Job | When | What |
|---|---|---|
| **pages** | every push + PR | tsc → build → deploy (PR gets preview URL) |
| **worker** | push to main only | build worker → deploy |

Add these **two** repo secrets:

| Secret | Where |
|---|---|
| `CLOUDFLARE_API_TOKEN` | dashboard → My Profile → API Tokens → "Cloudflare Pages — Edit" template (add Workers Scripts:Edit permission) |
| `CLOUDFLARE_ACCOUNT_ID` | dashboard right sidebar |

---

## Local development

```bash
# Frontend only (Vite hot-reload)
pnpm dev

# Worker locally (no real DB needed if your routers tolerate `getDb()` returning null)
pnpm dev:worker          # http://localhost:8787

# Both together
pnpm dev               # in one terminal
pnpm dev:worker        # in another
```

---

## Rollback

```bash
# Pages
wrangler pages deployment list --project-name talentos
wrangler pages deployment rollback <ID> --project-name talentos

# Workers — rollback to previous version
wrangler rollback --config wrangler.worker.toml
```

---

## Observability

- **Logs:** dashboard → Workers → talentos-api → Logs (real-time tail)
- **Or via CLI:** `wrangler tail --config wrangler.worker.toml`
- **Metrics:** Workers Analytics built-in (CPU time, errors, request counts)

---

## What I cannot do for you

- Run `wrangler login` (opens **your** browser for OAuth)
- See your API token (you must paste it into GitHub Secrets manually)
- Pay for the Cloudflare account if you go past the free tier

Everything else lives in this repo and is ready to go.
