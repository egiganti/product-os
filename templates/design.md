# design.md — [Product Name]

## Stack

| Layer | Technology | Why |
|-------|-----------|-----|
| Frontend | Next.js 15 + TypeScript | SSR, App Router, type safety |
| Styling | Tailwind CSS + shadcn/ui | Speed + consistency |
| Backend | Next.js API Routes | Colocation, simplicity |
| Database | Supabase (Postgres) | Auth + DB + Storage in one |
| Deploy | Vercel | Zero-config, edge network |
| CI/CD | GitHub Actions | product-os native |
| Testing | Vitest + Playwright | Unit + E2E |

## Architecture

```
[Client — Next.js App Router]
    ↓
[API Layer — /api/* routes]
    ↓
[Supabase — Postgres + RLS]
```

## Directory Structure

```
/
├── app/
│   ├── (auth)/
│   ├── api/
│   └── layout.tsx
├── components/
│   ├── ui/          ← Stitch + shadcn
│   └── [feature]/
├── lib/supabase/
├── __tests__/
├── e2e/
└── CLAUDE.md
```

## Environment Variables

```bash
# .env.example
NEXT_PUBLIC_SUPABASE_URL=your_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_key
SUPABASE_SERVICE_ROLE_KEY=your_service_key
```

## Performance Targets
- Lighthouse: > 90
- LCP: < 2.5s
- CLS: < 0.1
