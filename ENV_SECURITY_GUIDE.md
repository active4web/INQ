# Environment Variables Security Guide

This document outlines all environment variables used in Talentos Professional and security best practices.

## Required Environment Variables

### Database Configuration
- `DATABASE_URL`: MySQL connection string (e.g., `mysql://user:password@host:3306/database`)
  - **Security**: Never hardcode in code. Use environment variables only.
  - **Production**: Use strong passwords and SSL/TLS connections.

### OAuth Configuration (Manus)
- `VITE_APP_ID`: Manus OAuth application ID
- `OAUTH_SERVER_URL`: Manus OAuth server URL
- `VITE_OAUTH_PORTAL_URL`: Manus login portal URL
- `JWT_SECRET`: Secret key for JWT signing
  - **Security**: Use a strong, random secret (minimum 32 characters).
  - **Rotation**: Change periodically in production.

### Owner Information
- `OWNER_OPEN_ID`: Owner's Manus OpenID
- `OWNER_NAME`: Owner's display name

### Built-in Forge API (Manus)
- `BUILT_IN_FORGE_API_URL`: Manus Forge API URL
- `BUILT_IN_FORGE_API_KEY`: API key for server-side access
  - **Security**: Never expose in frontend code. Server-side only.
  - **Rotation**: Rotate keys regularly.

### Frontend Forge API (Manus)
- `VITE_FRONTEND_FORGE_API_URL`: Manus Forge API URL (frontend)
- `VITE_FRONTEND_FORGE_API_KEY`: API key for frontend access
  - **Security**: Limited scope for frontend use only.

### Optional Configuration
- `VITE_ANALYTICS_ENDPOINT`: Analytics service endpoint
- `VITE_ANALYTICS_WEBSITE_ID`: Analytics website ID
- `VITE_FRONTEND_URL`: Frontend URL for CORS
- `NODE_ENV`: Environment (development/production)
- `PORT`: Server port

## Security Best Practices

### 1. Never Hardcode Secrets
```typescript
// ❌ WRONG
const apiKey = "sk_live_abc123def456";

// ✅ CORRECT
const apiKey = process.env.BUILT_IN_FORGE_API_KEY;
```

### 2. Separate Frontend and Backend Secrets
- Backend secrets (API keys, database URLs) should NOT be accessible from frontend
- Frontend secrets should have limited scope
- Use `VITE_` prefix for frontend-accessible variables only

### 3. Validate Environment Variables at Startup
```typescript
// server/_core/env.ts validates all required environment variables
import { ENV } from "./env";

if (!ENV.databaseUrl) {
  throw new Error("DATABASE_URL environment variable is required");
}
```

### 4. Use Strong Secrets
- JWT_SECRET: Minimum 32 characters, use random generation
- API Keys: Use provider-generated keys with appropriate scopes
- Database passwords: Follow password policy requirements

### 5. Rotate Secrets Regularly
- Change API keys periodically
- Update JWT secrets when needed
- Monitor for unauthorized access

### 6. Environment-Specific Configuration
```typescript
// Different settings for different environments
if (process.env.NODE_ENV === "production") {
  // Use production endpoints and strict settings
  corsOrigin = process.env.VITE_FRONTEND_URL;
  sessionCookieSecure = true;
} else {
  // Development settings
  corsOrigin = ["http://localhost:5173", "http://localhost:3000"];
  sessionCookieSecure = false;
}
```

### 7. Secure Session Cookies
- `SESSION_COOKIE_SECURE`: true in production (HTTPS only)
- `SESSION_COOKIE_HTTP_ONLY`: true (prevent JavaScript access)
- `SESSION_COOKIE_SAME_SITE`: "strict" or "lax" (CSRF protection)

### 8. Rate Limiting Configuration
- `RATE_LIMIT_WINDOW_MS`: Time window for rate limiting (default: 15 minutes)
- `RATE_LIMIT_MAX_REQUESTS`: Maximum requests per window (default: 100)

## Deployment Checklist

- [ ] All required environment variables are set
- [ ] Secrets are stored securely (not in git)
- [ ] DATABASE_URL uses SSL/TLS connection
- [ ] JWT_SECRET is strong and random
- [ ] NODE_ENV is set to "production"
- [ ] SESSION_COOKIE_SECURE is true
- [ ] CORS_ORIGIN is set to production frontend URL
- [ ] API keys have appropriate scopes
- [ ] Monitoring is set up for unauthorized access
- [ ] Secrets are backed up securely

## Monitoring and Alerts

Monitor these security events:
- Unauthorized API access attempts
- Rate limit violations
- Failed authentication attempts
- Unusual database queries
- Configuration changes

## References

- [OWASP: Secrets Management](https://cheatsheetseries.owasp.org/cheatsheets/Secrets_Management_Cheat_Sheet.html)
- [Node.js Security Best Practices](https://nodejs.org/en/docs/guides/security/)
- [Environment Variables Best Practices](https://12factor.net/config)
