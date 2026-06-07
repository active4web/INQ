# Talentos Professional - Development Guide

## Quick Start

### Prerequisites
- Node.js 18+ and pnpm
- MySQL 8.0+
- Git

### Installation

```bash
# Clone and install
git clone <repo>
cd talentos-professional
pnpm install

# Setup environment
cp .env.example .env
# Edit .env with your configuration

# Setup database
pnpm drizzle-kit generate
pnpm drizzle-kit migrate

# Start development
pnpm dev
```

The app will be available at `http://localhost:3000`

---

## Project Organization

### Frontend (`client/src/`)

```
pages/              # Page components (one per route)
├── Home.tsx
├── JobsListPage.tsx
├── JobDetailsPage.tsx
├── DeveloperDashboardPage.tsx
├── CompanyDashboardPage.tsx
└── ...

components/         # Reusable UI components
├── ui/              # shadcn/ui components (auto-generated)
├── talent/          # Talent-specific components
│   ├── TalentScoreCard.tsx
│   ├── SkillRadar.tsx
│   └── AIMatchPanel.tsx
├── DashboardLayout.tsx
├── ProtectedRoute.tsx
└── ...

contexts/           # React contexts
├── AuthContext.tsx
├── LanguageContext.tsx
├── NotificationContext.tsx
└── ThemeContext.tsx

hooks/              # Custom React hooks
├── useAuth.ts
├── useComposition.ts
└── useMobile.tsx

lib/                # Utilities
├── api.ts           # API client
├── constants.ts     # Constants
├── matchingEngine.ts # AI matching
├── talentScore.ts   # Scoring
├── security.ts      # Security
├── validation.ts    # Form validation
├── utils.ts         # General utilities
└── trpc.ts          # tRPC client

types/              # TypeScript types
└── index.ts

data/               # Mock data
└── seed.ts
```

### Backend (`server/`)

```
_core/              # Core infrastructure
├── index.ts         # Server entry point
├── context.ts       # tRPC context
├── trpc.ts          # tRPC setup
├── oauth.ts         # OAuth handling
├── security.ts      # Security middleware
├── rateLimiter.ts   # Rate limiting
├── llm.ts           # LLM integration
├── notification.ts  # Notifications
└── ...

routers/            # Feature routers (modular)
├── auth.ts
├── jobs.ts
├── developers.ts
├── companies.ts
├── applications.ts
├── messages.ts
├── interviews.ts
└── ...

db.ts               # Database queries
routers.ts          # Main router (combines all)
storage.ts          # Storage helpers
```

### Database (`drizzle/`)

```
schema.ts           # Database schema
migrations/         # Migration files (auto-generated)
relations.ts        # Relationships
config.ts           # Drizzle config
```

---

## Adding a New Feature

### 1. Define Database Schema

Edit `drizzle/schema.ts`:

```typescript
export const myFeature = mysqlTable("my_feature", {
  id: int("id").autoincrement().primaryKey(),
  userId: int("userId").notNull(),
  name: varchar("name", { length: 255 }).notNull(),
  createdAt: timestamp("createdAt").defaultNow().notNull(),
}, (t) => [
  index("idx_userId").on(t.userId),
]);

export type MyFeature = typeof myFeature.$inferSelect;
export type InsertMyFeature = typeof myFeature.$inferInsert;
```

### 2. Generate Migration

```bash
pnpm drizzle-kit generate
# Select "create column" when prompted
```

### 3. Create Backend Router

Create `server/routers/myFeature.ts`:

```typescript
import { router, publicProcedure, protectedProcedure } from "../_core/trpc";
import { z } from "zod";

export const myFeatureRouter = router({
  list: publicProcedure
    .input(z.object({ skip: z.number(), take: z.number() }))
    .query(async ({ input }) => {
      const db = await getDb();
      return db.select().from(myFeature).limit(input.take).offset(input.skip);
    }),

  create: protectedProcedure
    .input(z.object({ name: z.string() }))
    .mutation(async ({ input, ctx }) => {
      const db = await getDb();
      return db.insert(myFeature).values({
        userId: ctx.user.id,
        name: input.name,
      });
    }),
});
```

### 4. Add to Main Router

Edit `server/routers.ts`:

```typescript
import { myFeatureRouter } from "./routers/myFeature";

export const appRouter = router({
  myFeature: myFeatureRouter,
  // ... other routers
});
```

### 5. Create Frontend Page

Create `client/src/pages/MyFeaturePage.tsx`:

```typescript
import { trpc } from "@/lib/trpc";
import { Button } from "@/components/ui/button";

export default function MyFeaturePage() {
  const { data, isLoading } = trpc.myFeature.list.useQuery({ skip: 0, take: 10 });
  const createMutation = trpc.myFeature.create.useMutation();

  const handleCreate = async () => {
    await createMutation.mutateAsync({ name: "New Item" });
  };

  if (isLoading) return <div>Loading...</div>;

  return (
    <div>
      <h1>My Feature</h1>
      <Button onClick={handleCreate}>Create</Button>
      {data?.map((item) => (
        <div key={item.id}>{item.name}</div>
      ))}
    </div>
  );
}
```

### 6. Add Route

Edit `client/src/App.tsx`:

```typescript
const MyFeaturePage = lazy(() => import("./pages/MyFeaturePage"));

<Route path="/my-feature" component={MyFeaturePage} />
```

### 7. Write Tests

Create `server/routers/myFeature.test.ts`:

```typescript
import { describe, it, expect } from "vitest";
import { myFeatureRouter } from "./myFeature";

describe("myFeature router", () => {
  it("should list features", async () => {
    const caller = myFeatureRouter.createCaller({} as any);
    const result = await caller.list({ skip: 0, take: 10 });
    expect(Array.isArray(result)).toBe(true);
  });
});
```

---

## Common Tasks

### Add a New Page

1. Create component in `client/src/pages/NewPage.tsx`
2. Import in `client/src/App.tsx`
3. Add route: `<Route path="/new-page" component={NewPage} />`

### Add a New API Endpoint

1. Create router in `server/routers/feature.ts`
2. Add to `server/routers.ts`
3. Call from frontend with `trpc.feature.method.useQuery/useMutation()`

### Add a New Component

1. Create in `client/src/components/MyComponent.tsx`
2. Import and use in pages/other components
3. Add TypeScript props interface

### Update Database Schema

1. Edit `drizzle/schema.ts`
2. Run `pnpm drizzle-kit generate`
3. Review generated SQL
4. Run `pnpm drizzle-kit migrate`

### Add Form Validation

1. Create Zod schema in `client/src/lib/validation.ts`
2. Use with `useForm` hook:

```typescript
const { register, handleSubmit } = useForm({
  resolver: zodResolver(mySchema),
});
```

---

## Code Style

### TypeScript
- Use strict mode
- Always type function parameters and returns
- Use interfaces for object types
- Avoid `any` type

### React
- Use functional components
- Use hooks for state management
- Keep components small and focused
- Use TypeScript for props

### Naming Conventions
- Components: PascalCase (MyComponent.tsx)
- Files: PascalCase for components, camelCase for utilities
- Variables: camelCase
- Constants: UPPER_SNAKE_CASE
- Database tables: snake_case

### File Organization
- One component per file
- Related utilities in same folder
- Tests next to source files

---

## Testing

### Run Tests
```bash
pnpm test
```

### Write Tests
```typescript
import { describe, it, expect } from "vitest";

describe("feature", () => {
  it("should do something", () => {
    expect(true).toBe(true);
  });
});
```

### Test Coverage
```bash
pnpm test -- --coverage
```

---

## Performance

### Frontend
- Use React.lazy for code splitting
- Implement pagination for lists
- Memoize expensive computations
- Use useCallback for event handlers
- Optimize images

### Backend
- Add database indexes
- Use pagination
- Cache frequently accessed data
- Optimize queries with EXPLAIN
- Use rate limiting

### Database
- Add indexes on frequently queried columns
- Use appropriate data types
- Avoid N+1 queries
- Use transactions for multi-step operations

---

## Security

### Input Validation
- Validate all user input on backend
- Use Zod schemas
- Sanitize text inputs

### Authentication
- Use protected procedures for sensitive endpoints
- Check user role/permissions
- Validate JWT tokens

### Database
- Use parameterized queries (Drizzle handles this)
- Never concatenate SQL strings
- Use prepared statements

### API Security
- Enable CORS whitelist
- Implement rate limiting
- Use HTTPS only
- Add security headers

---

## Debugging

### Frontend
- Use browser DevTools
- Check console for errors
- Use React DevTools
- Use network tab for API calls

### Backend
- Check server logs
- Use console.log for debugging
- Use debugger breakpoints
- Check database queries

### Database
- Use MySQL client to inspect data
- Run EXPLAIN on slow queries
- Check indexes
- Monitor connection pool

---

## Deployment

### Build
```bash
pnpm build
```

### Environment
- Set all required environment variables
- Use production database
- Enable security headers
- Configure CDN

### Database
- Run migrations
- Backup database
- Monitor performance
- Set up replication

### Monitoring
- Set up error tracking
- Monitor API response times
- Track user analytics
- Set up alerts

---

## Troubleshooting

### Database Connection Error
```
Error: connect ECONNREFUSED
```
- Check MySQL is running
- Verify DATABASE_URL
- Check network connectivity

### TypeScript Errors
```
pnpm check
```
- Review error messages
- Update types after schema changes
- Use `as any` sparingly

### Build Errors
```
pnpm build
```
- Check for missing dependencies
- Verify all imports
- Check TypeScript errors

### Runtime Errors
- Check server logs
- Check browser console
- Review network requests
- Check database queries

---

## Resources

- [React Documentation](https://react.dev)
- [TypeScript Handbook](https://www.typescriptlang.org/docs)
- [tRPC Documentation](https://trpc.io)
- [Drizzle ORM](https://orm.drizzle.team)
- [Tailwind CSS](https://tailwindcss.com)
- [shadcn/ui](https://ui.shadcn.com)

---

## Support

For questions or issues:
1. Check ARCHITECTURE.md for overview
2. Review code comments
3. Check test files for examples
4. Search GitHub issues
5. Ask in team chat
