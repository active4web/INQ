# Talentos Professional - AI-Powered Talent Marketplace

> Connecting developers with companies through intelligent matching and comprehensive talent assessment.

## Overview

Talentos Professional is a modern talent marketplace platform that leverages AI to match developers with job opportunities. The platform features:

- **AI-Powered Matching** - Intelligent job-to-developer matching based on skills and experience
- **Talent Scoring** - 5-signal talent assessment (GitHub, Skills, Interview, English, Reliability)
- **Real-time Messaging** - Direct communication between developers and companies
- **Job Management** - Comprehensive job posting and application tracking
- **Developer Profiles** - Rich profiles with skills, experience, and portfolio links
- **Company Dashboards** - Analytics and candidate pipeline management
- **Multilingual Support** - English and Arabic interface
- **Security First** - OWASP-compliant security implementation

## Tech Stack

| Layer | Technology |
|-------|-----------|
| **Frontend** | React 19, TypeScript, Tailwind CSS 4, Vite |
| **Backend** | Express 4, tRPC 11, Node.js |
| **Database** | MySQL 8.0+, Drizzle ORM |
| **Authentication** | Manus OAuth |
| **Real-time** | Socket.io (planned) |
| **Deployment** | Cloud Run, Manus Platform |

## Quick Start

### Prerequisites
```bash
Node.js 18+
pnpm 10+
MySQL 8.0+
```

### Installation

```bash
# 1. Clone repository
git clone <repository-url>
cd talentos-professional

# 2. Install dependencies
pnpm install

# 3. Setup environment
cp .env.example .env
# Edit .env with your configuration

# 4. Setup database
pnpm drizzle-kit generate
pnpm drizzle-kit migrate

# 5. Start development server
pnpm dev
```

The application will be available at `http://localhost:3000`

## Project Structure

```
talentos-professional/
├── client/                  # React frontend
│   ├── src/
│   │   ├── pages/          # Page components
│   │   ├── components/     # Reusable components
│   │   ├── contexts/       # React contexts
│   │   ├── hooks/          # Custom hooks
│   │   ├── lib/            # Utilities
│   │   └── types/          # TypeScript types
│   └── vite.config.ts
│
├── server/                  # Express backend
│   ├── _core/              # Core infrastructure
│   ├── routers/            # Feature routers
│   ├── db.ts               # Database queries
│   └── routers.ts          # Main router
│
├── drizzle/                 # Database
│   ├── schema.ts           # Schema definition
│   └── migrations/         # Migration files
│
├── shared/                  # Shared code
├── ARCHITECTURE.md          # Architecture guide
├── DEVELOPMENT.md           # Development guide
└── package.json
```

## Key Features

### 1. Authentication
- Manus OAuth integration
- Role-based access control (Developer, Company, Admin)
- Session management with JWT

### 2. Job Management
- Create, edit, and manage job postings
- Advanced filtering and search
- Application tracking and status management

### 3. Developer Profiles
- Comprehensive profile management
- Skill and experience tracking
- Portfolio and social links
- Talent score calculation

### 4. AI Matching
- Intelligent job-to-developer matching
- Explainable match reasons
- Recommendation engine
- Skill-based filtering

### 5. Messaging
- Real-time messaging between developers and companies
- Conversation history
- Message notifications

### 6. Interview Scheduling
- Schedule and manage interviews
- Interview types (phone, video, in-person)
- Feedback and ratings

### 7. Analytics
- Job view tracking
- Application statistics
- Talent score analytics
- User engagement metrics

## Development

### Adding a Feature

1. **Define Database Schema**
   ```bash
   # Edit drizzle/schema.ts
   pnpm drizzle-kit generate
   ```

2. **Create Backend Router**
   ```bash
   # Create server/routers/feature.ts
   # Add to server/routers.ts
   ```

3. **Create Frontend Page**
   ```bash
   # Create client/src/pages/FeaturePage.tsx
   # Add route to client/src/App.tsx
   ```

4. **Write Tests**
   ```bash
   # Create server/routers/feature.test.ts
   pnpm test
   ```

See [DEVELOPMENT.md](./DEVELOPMENT.md) for detailed instructions.

## API Documentation

### Authentication
- `auth.me` - Get current user
- `auth.logout` - Logout

### Jobs
- `jobs.list` - List jobs with filters
- `jobs.getById` - Get job details
- `jobs.create` - Create job (company only)
- `jobs.search` - Search jobs

### Developers
- `developers.getProfile` - Get developer profile
- `developers.updateProfile` - Update profile
- `developers.getRecommendations` - Get recommendations

### Applications
- `applications.apply` - Apply for job
- `applications.updateStatus` - Update status
- `applications.getByDeveloper` - Get applications

### Messages
- `messages.list` - List conversations
- `messages.send` - Send message
- `messages.getHistory` - Get history

See [ARCHITECTURE.md](./ARCHITECTURE.md) for complete API reference.

## Database Schema

### Core Tables
- `users` - User accounts
- `developer_profiles` - Developer information
- `company_profiles` - Company information
- `jobs` - Job postings
- `applications` - Job applications
- `messages` - Direct messages
- `conversations` - Message threads
- `interviews` - Interview scheduling
- `notifications` - User notifications
- `analytics` - Event tracking

See [ARCHITECTURE.md](./ARCHITECTURE.md) for detailed schema.

## Security

### Implementation
- ✅ Input sanitization (XSS prevention)
- ✅ Rate limiting (100/15min general, 5/15min auth)
- ✅ Parameterized queries (SQL injection prevention)
- ✅ OWASP security headers
- ✅ CORS whitelist
- ✅ Environment variable management
- ✅ Frontend and backend validation

See [SECURITY_IMPLEMENTATION.md](./SECURITY_IMPLEMENTATION.md) for details.

## Environment Variables

```env
# Database
DATABASE_URL=mysql://user:password@localhost/talentos

# Authentication
JWT_SECRET=your-jwt-secret
OAUTH_SERVER_URL=https://api.manus.im
VITE_APP_ID=your-app-id

# Owner
OWNER_OPEN_ID=owner-id
OWNER_NAME=Owner Name

# APIs
BUILT_IN_FORGE_API_URL=https://api.manus.im
BUILT_IN_FORGE_API_KEY=your-api-key

# App
VITE_APP_TITLE=Talentos Professional
VITE_APP_LOGO=https://example.com/logo.png
```

## Commands

```bash
# Development
pnpm dev              # Start dev server
pnpm check            # Type checking
pnpm test             # Run tests
pnpm format           # Format code

# Database
pnpm drizzle-kit generate   # Generate migration
pnpm drizzle-kit migrate    # Apply migration

# Production
pnpm build            # Build for production
pnpm start            # Start production server
```

## Deployment

### Build
```bash
pnpm build
```

### Environment Setup
1. Set all required environment variables
2. Configure database connection
3. Set up OAuth credentials

### Database
```bash
pnpm drizzle-kit migrate
```

### Publish
1. Create checkpoint in Management UI
2. Click "Publish" button
3. Configure custom domain if needed

## Testing

```bash
# Run all tests
pnpm test

# Run specific test file
pnpm test -- server/routers/jobs.test.ts

# Watch mode
pnpm test -- --watch

# Coverage
pnpm test -- --coverage
```

## Performance

### Frontend Optimization
- Code splitting with React.lazy
- Image optimization
- Memoization of expensive computations
- Pagination for large lists

### Backend Optimization
- Database indexing
- Query optimization
- Caching strategies
- Rate limiting

### Database Optimization
- Strategic indexes
- Appropriate data types
- Connection pooling
- Query analysis

## Monitoring

### Logs
- Server logs: `.manus-logs/devserver.log`
- Browser console: `.manus-logs/browserConsole.log`
- Network requests: `.manus-logs/networkRequests.log`

### Analytics
- Event tracking via analytics API
- User engagement metrics
- Application statistics
- Performance monitoring

## Troubleshooting

### Common Issues

**Database Connection Error**
- Verify DATABASE_URL is correct
- Check MySQL is running
- Test network connectivity

**OAuth Login Fails**
- Verify VITE_APP_ID is correct
- Check OAUTH_SERVER_URL is accessible
- Clear browser cookies

**Type Errors**
- Run `pnpm check` to see all errors
- Ensure schema matches types
- Update types after schema changes

**Build Errors**
- Check for missing dependencies
- Verify all imports
- Review TypeScript errors

See [DEVELOPMENT.md](./DEVELOPMENT.md) for more troubleshooting.

## Contributing

1. Create a feature branch
2. Follow the development workflow
3. Write tests for new features
4. Update documentation
5. Submit pull request

## Documentation

- [ARCHITECTURE.md](./ARCHITECTURE.md) - System architecture and design
- [DEVELOPMENT.md](./DEVELOPMENT.md) - Development guide and best practices
- [SECURITY_IMPLEMENTATION.md](./SECURITY_IMPLEMENTATION.md) - Security details
- [ENV_SECURITY_GUIDE.md](./ENV_SECURITY_GUIDE.md) - Environment variables

## License

MIT

## Support

For questions or issues:
1. Check documentation files
2. Review code comments
3. Check test files for examples
4. Contact development team

## Roadmap

- [ ] Real-time notifications via WebSocket
- [ ] Video interview integration
- [ ] Payment processing (Stripe)
- [ ] Admin dashboard
- [ ] Advanced analytics
- [ ] Mobile app
- [ ] API marketplace
- [ ] Integration with GitHub/LinkedIn

## Team

Built with ❤️ by the Talentos Professional team.

---

**Last Updated:** June 2026  
**Version:** 2.0.0  
**Status:** Production Ready
