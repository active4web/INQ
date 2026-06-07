# Operations Runbook

## Health checks
- `GET /health` — liveness, returns 200
- `GET /ready`  — readiness, checks DB connection

## Common operations

### Deploy
```bash
docker compose -f docker-compose.yml up -d --build
```

### Rollback
```bash
docker compose down
docker compose up -d --build app:previous-tag
```

### View logs
```bash
docker compose logs -f app
# Structured JSON — filter with jq
docker compose logs app | jq 'select(.level == "error")'
```

### Database migration
```bash
pnpm db:push
```

### Suspend a user (emergency)
```sql
INSERT INTO user_suspensions (userId, suspendedBy, reason, endsAt)
VALUES (?, 1, 'manual: <reason>', DATE_ADD(NOW(), INTERVAL 30 DAY));
```

## On-call SOPs

### Symptom: 401 spike
1. Check auth logs: `docker compose logs app | jq 'select(.msg | contains("auth"))'`
2. Verify JWT secret hasn't rotated unexpectedly
3. Check rate limiter — `authLimiter` blocks at 5/15min

### Symptom: DB connection errors
1. `docker compose ps db` — service up?
2. `docker compose exec db mysql -uroot -p -e "SHOW PROCESSLIST"`
3. Restart pool: `docker compose restart app`

### Symptom: high error rate from one IP
1. Check `auditLogs` for that IP
2. Add to WAF deny list (see WAF_CONFIGURATION.md when wired)
