# OWASP Security Implementation Guide

This document details the security enhancements implemented in Talentos Professional following OWASP guidelines.

## 1. Input Sanitization

### Implementation
- **File**: `server/_core/security.ts`
- **Functions**:
  - `sanitizeInput()`: Removes XSS attacks using the `xss` library
  - `sanitizeUrl()`: Prevents malicious redirects
  - `sanitizeEmail()`: Validates and normalizes email addresses
  - `sanitizeSearchQuery()`: Sanitizes search terms for safe database queries

### Usage Example
```typescript
import { sanitizeInput, validateJobTitle } from "./server/_core/security";

// Sanitize user input
const cleanInput = sanitizeInput(userInput);

// Validate with specific rules
const jobTitle = validateJobTitle(formData.title);
```

### Protected Areas
- Form inputs (job posting, applications, profile updates)
- Search queries
- URL parameters
- Email addresses
- All user-generated content

## 2. Rate Limiting

### Implementation
- **File**: `server/_core/rateLimiter.ts`
- **Middleware**: Integrated into `server/_core/index.ts`

### Rate Limits Applied
| Endpoint | Limit | Window |
|----------|-------|--------|
| General API | 100 requests | 15 minutes |
| Authentication | 5 requests | 15 minutes |
| Search | 30 requests | 1 minute |
| Job Posting | 10 requests | 1 hour |
| Applications | 20 requests | 1 hour |
| Messaging | 60 requests | 1 hour |
| Profile Updates | 10 requests | 1 hour |

### Configuration
```typescript
// In server/_core/index.ts
app.use("/api/", apiLimiter); // General rate limiting
app.use("/api/oauth/", authLimiter); // Auth-specific limiting
```

## 3. SQL Injection Prevention

### Implementation
- **File**: `server/_core/sqlInjectionPrevention.ts`
- **Method**: Parameterized queries using Drizzle ORM

### Key Features
- All database queries use Drizzle ORM's query builder (parameterized queries)
- Input validation before database operations
- Type-safe query construction
- Safe search query building with `buildSafeSearchQuery()`
- Validation functions for IDs, enums, and pagination

### Usage Example
```typescript
import { validateNumericId, SafeQueryBuilder } from "./server/_core/sqlInjectionPrevention";

// Validate ID before use
const jobId = validateNumericId(req.body.jobId);

// Build safe WHERE conditions
const conditions = SafeQueryBuilder.buildWhereConditions(
  { status: "published", type: "full-time" },
  ["status", "type"]
);
```

### Database Query Safety
- All user inputs are validated before reaching database
- Drizzle ORM automatically parameterizes all queries
- Type system prevents invalid data types
- No string concatenation in SQL queries

## 4. Frontend Validation

### Implementation
- **File**: `client/src/lib/validation.ts`
- **Library**: Zod for schema validation

### Validation Schemas
- Email validation
- Job title and description validation
- Location and salary validation
- Skills and experience validation
- URL validation (portfolio, GitHub, LinkedIn)
- Enum validation (job type, experience level, etc.)
- Pagination and filtering validation

### Usage Example
```typescript
import { validateFormData, jobPostingFormSchema } from "@/lib/validation";

const result = validateFormData(jobPostingFormSchema, formData);
if (!result.success) {
  // Display errors to user
  console.log(result.errors);
} else {
  // Process validated data
  submitForm(result.data);
}
```

## 5. Backend Validation

### Implementation
- **File**: `server/_core/security.ts`
- **Validation Schemas**: Zod schemas for all major operations

### Validated Operations
- Job posting creation and updates
- Job applications
- Developer profile updates
- Messaging
- Search queries
- Pagination parameters

### Example
```typescript
import { jobPostingSchema } from "./server/_core/security";

// In tRPC procedure
const validated = jobPostingSchema.parse(input);
// If validation fails, tRPC automatically returns error to client
```

## 6. Environment Variables Security

### Implementation
- **File**: `server/_core/env.ts`
- **Documentation**: `ENV_SECURITY_GUIDE.md`

### Key Practices
- No hardcoded secrets in code
- All sensitive data loaded from environment variables
- Validation of required environment variables at startup
- Separate frontend and backend secrets using `VITE_` prefix
- Strong JWT secrets (minimum 32 characters)
- Secure database connection strings

### Environment Variable Categories
| Category | Variables | Security Level |
|----------|-----------|-----------------|
| Database | DATABASE_URL | Critical |
| OAuth | VITE_APP_ID, OAUTH_SERVER_URL | Critical |
| API Keys | BUILT_IN_FORGE_API_KEY | Critical |
| Frontend Keys | VITE_FRONTEND_FORGE_API_KEY | High |
| Session | JWT_SECRET | Critical |
| Configuration | NODE_ENV, PORT | Medium |

## 7. Security Headers

### Implementation
- **Middleware**: Helmet.js in `server/_core/index.ts`

### Headers Applied
- `X-Content-Type-Options: nosniff`
- `X-Frame-Options: DENY`
- `X-XSS-Protection: 1; mode=block`
- `Strict-Transport-Security` (HSTS)
- `Content-Security-Policy`
- `Referrer-Policy`

## 8. CORS Configuration

### Implementation
- **File**: `server/_core/index.ts`

### Configuration
```typescript
app.use(cors({
  origin: process.env.NODE_ENV === "production" 
    ? process.env.VITE_FRONTEND_URL 
    : ["http://localhost:5173", "http://localhost:3000"],
  credentials: true,
}));
```

### Security Features
- Whitelist-based origin validation
- Credentials support with same-origin policy
- Environment-specific configuration

## 9. Session Security

### Implementation
- **Framework**: Manus OAuth integration
- **Cookies**: Secure, HttpOnly, SameSite attributes

### Configuration
```typescript
// Secure session cookies
{
  secure: true,        // HTTPS only in production
  httpOnly: true,      // Prevent JavaScript access
  sameSite: "strict",  // CSRF protection
  maxAge: 7 * 24 * 60 * 60 * 1000 // 7 days
}
```

## 10. Error Handling

### Implementation
- **File**: `server/_core/index.ts`

### Security Practices
- Generic error messages in production
- Detailed error logs for debugging
- No sensitive information in error responses
- Proper HTTP status codes

### Example
```typescript
app.use((err: any, req: Request, res: Response) => {
  console.error("[Error]", err);
  res.status(err.status || 500).json({
    error: process.env.NODE_ENV === "production" 
      ? "Internal server error" 
      : err.message,
  });
});
```

## Testing Security

### Manual Testing Checklist
- [ ] Test input sanitization with XSS payloads
- [ ] Verify rate limiting with multiple requests
- [ ] Test SQL injection attempts (should fail)
- [ ] Verify CORS headers are correct
- [ ] Check security headers are present
- [ ] Validate environment variables are required
- [ ] Test with invalid enum values
- [ ] Verify session cookies are secure
- [ ] Test error messages don't leak information

### Automated Testing
```bash
# Run security tests
pnpm test

# Check for vulnerabilities
npm audit

# Type checking
pnpm check
```

## Deployment Security Checklist

- [ ] All environment variables are set correctly
- [ ] DATABASE_URL uses SSL/TLS
- [ ] NODE_ENV is set to "production"
- [ ] JWT_SECRET is strong and random
- [ ] API keys are rotated regularly
- [ ] CORS_ORIGIN is set to production URL
- [ ] Security headers are enabled
- [ ] Rate limiting is active
- [ ] Logging and monitoring are enabled
- [ ] Regular security audits are scheduled

## Security Monitoring

### Recommended Monitoring
- Failed authentication attempts
- Rate limit violations
- Unusual database queries
- Configuration changes
- API errors and exceptions
- Performance anomalies

### Logging
- All security events are logged
- Logs include timestamp, user, action, and result
- Logs are stored securely and retained appropriately

## References

- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [OWASP Input Validation Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Input_Validation_Cheat_Sheet.html)
- [OWASP SQL Injection Prevention](https://cheatsheetseries.owasp.org/cheatsheets/SQL_Injection_Prevention_Cheat_Sheet.html)
- [OWASP Rate Limiting](https://cheatsheetseries.owasp.org/cheatsheets/Denial_of_Service_Prevention_Cheat_Sheet.html)
- [Node.js Security Best Practices](https://nodejs.org/en/docs/guides/security/)

## Support and Updates

For security issues or questions:
1. Review this documentation
2. Check the security implementation files
3. Run security tests
4. Monitor logs for security events
5. Keep dependencies updated with `npm audit fix`
