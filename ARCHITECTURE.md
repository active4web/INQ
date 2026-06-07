# Talentos Professional - Architecture & Development Guide

## Project Overview

Talentos Professional is an AI-powered talent marketplace connecting developers with companies. The platform features intelligent matching, talent scoring, real-time messaging, and comprehensive job management.

**Tech Stack:**
- **Frontend:** React 19 + TypeScript + Tailwind CSS 4 + Vite
- **Backend:** Express 4 + tRPC 11 + Node.js
- **Database:** MySQL with Drizzle ORM
- **Authentication:** Manus OAuth
- **Real-time:** Socket.io (planned)

---

## Project Structure

```
talentos-professional/
├── client/                          # Frontend application
│   ├── src/
│   │   ├── pages/                   # Page components (route-level)
│   │   │   ├── Home.tsx
│   │   │   ├── JobsListPage.tsx
│   │   │   ├── DeveloperDashboardPage.tsx
│   │   │   ├── CompanyDashboardPage.tsx
│   │   │   └── ...
│   │   ├── components/              # Reusable UI components
│   │   │   ├── ui/                  # shadcn/ui components
│   │   │   ├── talent/              # Talent-specific components
│   │   │   │   ├── TalentScoreCard.tsx
│   │   │   │   ├── SkillRadar.tsx
│   │   │   │   └── AIMatchPanel.tsx
│   │   │   ├── DashboardLayout.tsx
│   │   │   ├── ProtectedRoute.tsx
│   │   │   └── ...
│   │   ├── contexts/                # React contexts
│   │   │   ├── AuthContext.tsx
│   │   │   ├── LanguageContext.tsx
│   │   │   ├── NotificationContext.tsx
│   │   │   └── ThemeContext.tsx
│   │   ├── hooks/                   # Custom React hooks
│   │   │   ├── useAuth.ts
│   │   │   ├── useComposition.ts
│   │   │   └── useMobile.tsx
│   │   ├── lib/                     # Utilities and helpers
│   │   │   ├── api.ts               # API client
│   │   │   ├── constants.ts         # App constants
│   │   │   ├── matchingEngine.ts    # AI matching logic
│   │   │   ├── talentScore.ts       # Talent scoring
│   │   │   ├── security.ts          # Security utilities
│   │   │   ├── validation.ts        # Form validation
│   │   │   ├── utils.ts             # General utilities
│   │   │   └── trpc.ts              # tRPC client
│   │   ├── types/                   # TypeScript types
│   │   │   └── index.ts
│   │   ├── data/                    # Mock data and seeds
│   │   │   └── seed.ts
│   │   ├── App.tsx                  # Root component
│   │   ├── main.tsx                 # Entry point
│   │   └── index.css                # Global styles
│   ├── public/                      # Static assets
│   ├── index.html
│   └── vite.config.ts
│
├── server/                          # Backend application
│   ├── _core/                       # Core infrastructure
│   │   ├── index.ts                 # Server entry point
│   │   ├── context.ts               # tRPC context
│   │   ├── trpc.ts                  # tRPC setup
│   │   ├── oauth.ts                 # OAuth handling
│   │   ├── cookies.ts               # Cookie management
│   │   ├── security.ts              # Security middleware
│   │   ├── rateLimiter.ts           # Rate limiting
│   │   ├── llm.ts                   # LLM integration
│   │   ├── imageGeneration.ts       # Image generation
│   │   ├── voiceTranscription.ts    # Voice to text
│   │   ├── notification.ts          # Notifications
│   │   ├── map.ts                   # Maps integration
│   │   ├── storage.ts               # File storage
│   │   ├── dataApi.ts               # Data API
│   │   ├── env.ts                   # Environment variables
│   │   └── systemRouter.ts          # System routes
│   ├── routers/                     # Feature routers (modular)
│   │   ├── auth.ts                  # Authentication
│   │   ├── jobs.ts                  # Job management
│   │   ├── developers.ts            # Developer profiles
│   │   ├── companies.ts             # Company profiles
│   │   ├── applications.ts          # Job applications
│   │   ├── messages.ts              # Messaging
│   │   ├── interviews.ts            # Interview scheduling
│   │   ├── notifications.ts         # Notifications
│   │   └── analytics.ts             # Analytics
│   ├── db.ts                        # Database queries
│   ├── routers.ts                   # Main router (combines all)
│   └── storage.ts                   # Storage helpers
│
├── drizzle/                         # Database
│   ├── schema.ts                    # Database schema
│   ├── migrations/                  # Migration files
│   ├── relations.ts                 # Relationships
│   └── config.ts
│
├── shared/                          # Shared code
│   ├── const.ts                     # Shared constants
│   ├── types.ts                     # Shared types
│   └── _core/
│       └── errors.ts                # Error definitions
│
├── references/                      # Documentation
│   └── periodic-updates.md          # Scheduled tasks
│
├── .env.example                     # Environment template
├── package.json
├── tsconfig.json
├── vite.config.ts
├── drizzle.config.ts
└── README.md
```

---

## Development Workflow

### 1. Adding a New Feature

**Step 1: Define Database Schema**
```typescript
// drizzle/schema.ts
export const newFeature = mysqlTable("new_feature", {
  id: int("id").autoincrement().primaryKey(),
  // ... columns
});
```

**Step 2: Generate Migration**
```bash
pnpm drizzle-kit generate
```

**Step 3: Create Backend Router**
```typescript
// server/routers/newFeature.ts
export const newFeatureRouter = router({
  list: protectedProcedure.query(async ({ ctx }) => {
    // Implementation
  }),
  create: protectedProcedure.input(createSchema).mutation(async ({ input, ctx }) => {
    // Implementation
  }),
});
```

**Step 4: Add to Main Router**
```typescript
// server/routers.ts
export const appRouter = router({
  newFeature: newFeatureRouter,
  // ...
});
```

**Step 5: Create Frontend Component**
```typescript
// client/src/pages/NewFeaturePage.tsx
export default function NewFeaturePage() {
  const { data } = trpc.newFeature.list.useQuery();
  // Implementation
}
```

**Step 6: Add Route**
```typescript
// client/src/App.tsx
<Route path="/new-feature" component={NewFeaturePage} />
```

**Step 7: Write Tests**
```typescript
// server/routers/newFeature.test.ts
describe("newFeature router", () => {
  it("should list features", async () => {
    // Test implementation
  });
});
```

---

## Backend Architecture

### tRPC Router Organization

Each feature has its own router file in `server/routers/`:

```typescript
// server/routers/jobs.ts
import { router, publicProcedure, protectedProcedure } from "../_core/trpc";

export const jobsRouter = router({
  list: publicProcedure
    .input(z.object({ skip: z.number(), take: z.number() }))
    .query(async ({ input }) => {
      return getJobs(input.skip, input.take);
    }),
  
  getById: publicProcedure
    .input(z.number())
    .query(async ({ input }) => {
      return getJobById(input);
    }),
  
  create: protectedProcedure
    .input(jobSchema)
    .mutation(async ({ input, ctx }) => {
      if (ctx.user.role !== "company") throw new Error("Unauthorized");
      return createJob(input, ctx.user.id);
    }),
});
```

### Database Query Pattern

```typescript
// server/db.ts
export async function getJobs(skip: number, take: number) {
  const db = await getDb();
  if (!db) throw new Error("Database unavailable");
  
  return db
    .select()
    .from(jobs)
    .where(eq(jobs.status, "published"))
    .limit(take)
    .offset(skip);
}
```

### Security Layers

1. **Input Validation** - Zod schemas on all inputs
2. **Rate Limiting** - Per-endpoint rate limits
3. **SQL Injection Prevention** - Parameterized queries via Drizzle
4. **XSS Prevention** - Input sanitization
5. **CORS** - Whitelist configuration
6. **Authentication** - OAuth + Session cookies

---

## Frontend Architecture

### Page Structure

```typescript
// client/src/pages/ExamplePage.tsx
import { useAuth } from "@/contexts/AuthContext";
import { trpc } from "@/lib/trpc";

export default function ExamplePage() {
  const { user } = useAuth();
  const { data, isLoading } = trpc.example.list.useQuery();
  
  if (isLoading) return <LoadingSpinner />;
  
  return (
    <div className="container">
      {/* Content */}
    </div>
  );
}
```

### Component Hierarchy

- **Pages** - Route-level components in `pages/`
- **Layouts** - DashboardLayout, MainLayout
- **Features** - Feature-specific components (talent/, job/, etc.)
- **UI** - shadcn/ui components in `components/ui/`
- **Shared** - Reusable components

### State Management

- **Auth** - AuthContext
- **Language** - LanguageContext
- **Theme** - ThemeContext
- **Notifications** - NotificationContext
- **Data** - tRPC queries/mutations

---

## Database Schema

### Core Tables

| Table | Purpose |
|-------|---------|
| `users` | User accounts with OAuth integration |
| `developer_profiles` | Developer information and talent scores |
| `company_profiles` | Company information |
| `jobs` | Job postings |
| `applications` | Job applications |
| `messages` | Direct messages |
| `conversations` | Message threads |
| `interviews` | Interview scheduling |
| `notifications` | User notifications |
| `analytics` | Event tracking |
| `saved_jobs` | Bookmarked jobs |

### Key Relationships

```
users (1) ──→ (1) developer_profiles
users (1) ──→ (1) company_profiles
companies (1) ──→ (many) jobs
jobs (1) ──→ (many) applications
developers (1) ──→ (many) applications
developers (1) ──→ (many) saved_jobs
```

---

## API Endpoints (tRPC Procedures)

### Authentication
- `auth.me` - Get current user
- `auth.logout` - Logout

### Jobs
- `jobs.list` - List jobs with filters
- `jobs.getById` - Get job details
- `jobs.create` - Create job (company only)
- `jobs.update` - Update job (company only)
- `jobs.search` - Search jobs

### Developers
- `developers.getProfile` - Get developer profile
- `developers.updateProfile` - Update profile
- `developers.getRecommendations` - Get job recommendations
- `developers.getTalentScore` - Get talent score

### Companies
- `companies.getProfile` - Get company profile
- `companies.updateProfile` - Update profile
- `companies.getApplications` - Get applications for company

### Applications
- `applications.apply` - Apply for job
- `applications.updateStatus` - Update application status
- `applications.getByDeveloper` - Get developer's applications

### Messages
- `messages.list` - List conversations
- `messages.send` - Send message
- `messages.getHistory` - Get message history

### Interviews
- `interviews.schedule` - Schedule interview
- `interviews.update` - Update interview
- `interviews.list` - List interviews

---

## Environment Variables

```
# Database
DATABASE_URL=mysql://user:password@localhost/talentos

# Authentication
JWT_SECRET=your-jwt-secret
OAUTH_SERVER_URL=https://api.manus.im
VITE_OAUTH_PORTAL_URL=https://portal.manus.im
VITE_APP_ID=your-app-id

# Owner
OWNER_OPEN_ID=owner-id
OWNER_NAME=Owner Name

# APIs
BUILT_IN_FORGE_API_URL=https://api.manus.im
BUILT_IN_FORGE_API_KEY=your-api-key
VITE_FRONTEND_FORGE_API_URL=https://api.manus.im
VITE_FRONTEND_FORGE_API_KEY=your-frontend-key

# Analytics
VITE_ANALYTICS_ENDPOINT=https://analytics.manus.im
VITE_ANALYTICS_WEBSITE_ID=your-website-id

# App
VITE_APP_TITLE=Talentos Professional
VITE_APP_LOGO=https://example.com/logo.png
```

---

## Development Commands

```bash
# Install dependencies
pnpm install

# Start development server
pnpm dev

# Build for production
pnpm build

# Start production server
pnpm start

# Run tests
pnpm test

# Type checking
pnpm check

# Format code
pnpm format

# Generate database migration
pnpm drizzle-kit generate

# Push database changes
pnpm drizzle-kit migrate
```

---

## Best Practices

### Backend
1. Always validate input with Zod schemas
2. Use `protectedProcedure` for authenticated endpoints
3. Implement proper error handling
4. Add rate limiting to sensitive endpoints
5. Log important events for analytics
6. Use transactions for multi-step operations

### Frontend
1. Use tRPC hooks for data fetching
2. Implement optimistic updates where appropriate
3. Show loading and error states
4. Sanitize user input before display
5. Use TypeScript for type safety
6. Keep components small and focused

### Database
1. Add indexes on frequently queried columns
2. Use appropriate data types
3. Implement soft deletes where needed
4. Add timestamps (createdAt, updatedAt)
5. Use foreign keys for relationships
6. Regular backups

---

## Testing Strategy

### Unit Tests
- Test individual functions and utilities
- Mock external dependencies
- Use Vitest for fast execution

### Integration Tests
- Test tRPC procedures with database
- Test authentication flows
- Test data validation

### E2E Tests
- Test complete user flows
- Test cross-browser compatibility
- Test responsive design

---

## Deployment Checklist

- [ ] All tests passing
- [ ] Environment variables configured
- [ ] Database migrations applied
- [ ] Security headers configured
- [ ] Rate limiting enabled
- [ ] Error logging configured
- [ ] Analytics tracking enabled
- [ ] Backup strategy in place
- [ ] SSL certificate installed
- [ ] CDN configured for static assets

---

## Troubleshooting

### Common Issues

**Database Connection Error**
- Check DATABASE_URL is correct
- Verify MySQL server is running
- Check network connectivity

**OAuth Login Fails**
- Verify VITE_APP_ID is correct
- Check OAUTH_SERVER_URL is accessible
- Clear browser cookies

**Type Errors**
- Run `pnpm check` to see all errors
- Ensure schema matches types
- Update types after schema changes

**Performance Issues**
- Add database indexes
- Implement caching
- Optimize queries with EXPLAIN
- Use pagination for large datasets

---

## Contributing

1. Create a feature branch
2. Follow the development workflow
3. Write tests for new features
4. Update documentation
5. Submit pull request

---

## Support

For issues or questions, refer to:
- Architecture guide (this file)
- README.md for quick start
- Code comments for implementation details
- Test files for usage examples
