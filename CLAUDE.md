# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Plan Mode Default

- Enter plan mode for any non-trivial task (3+ steps or architectural decisions)
- If something goes wrong, STOP and re-plan immediately — don't keep pushing
- Use plan mode for verification steps, not just building
- Write detailed specs upfront to reduce ambiguity

## Subagent Strategy

- Use subagents frequently to keep the main context window clean
- Offload research, exploration, and parallel analysis to subagents
- For complex problems, throw more compute via subagents
- Assign one task per subagent for focused execution

## Self-Improvement Loop

- After any correction from the user, update tasks/lessons.md with the pattern
- Write rules for yourself to prevent repeating the same mistake
- Ruthlessly iterate on these lessons until the mistake rate drops
- Review lessons at the start of each session

## Verification Before Done

- Never mark a task complete without proving it works
- Diff behavior between main and your changes when relevant
- Ask yourself: "Would a staff engineer approve this?"
- Run tests, check logs, and demonstrate correctness

## Demand Elegance (Balanced)

- For non-trivial changes, ask: "Is there a more elegant solution?"
- If a fix feels hacky, ask: "Knowing everything I know now, implement the elegant solution."
- Skip this for simple fixes — don't over-engineer
- Challenge your own work before presenting it

## Autonomous Bug Fixing

- When given a bug report: just fix it
- Use logs, errors, and failing tests to diagnose
- Require zero context switching from the user
- Fix failing CI tests automatically

## Task Management

1. **Plan First** – Write the plan in tasks/todo.md with checkable items
2. **Verify Plan** – Confirm the plan before implementation
3. **Track Progress** – Mark items complete as you go
4. **Explain Changes** – Provide a high-level summary at each step
5. **Document Results** – Add a review section to tasks/todo.md
6. **Capture Lessons** – Update tasks/lessons.md after corrections

## Core Principles

- **Simplicity First** – Make every change as simple as possible and minimize code impact.
- **No Laziness** – Find root causes. Avoid temporary fixes. Maintain senior-level engineering standards.

## Project Architecture

BrazilFinance is a fintech API platform for Brazilian financial data integration with Google Sheets.

### Structure
```
brazilfinance/
├── backend/
│   ├── app/
│   │   ├── main.py              # FastAPI application
│   │   ├── collectors/          # Data collectors (BCB, Focus, B3, Tesouro)
│   │   └── cache/               # Caching system
│   ├── requirements.txt         # Python dependencies
│   └── Dockerfile              # Container configuration
├── sheets-addon/
│   ├── Code.js                 # Google Apps Script functions
│   ├── Menu.js                 # Google Sheets menu integration
│   ├── Sidebar.html            # User interface
│   └── appsscript.json         # Apps Script manifest
├── landing-page/
│   └── index.html              # Marketing website
├── docs/                       # Business documentation
│   ├── business/               # Business plan, pitch deck
│   ├── financial/              # Financial models
│   └── legal/                  # Legal structure
└── start.py                    # Railway deployment script
```

### Backend (FastAPI)
- Entry: `backend/app/main.py`
- Endpoints: `/v1/bcb/{indicator}`, `/v1/focus/{indicator}`, `/v1/b3/{ticker}`, `/v1/tesouro/{titulo}`
- Config: Environment-based (PORT, API keys)
- Deployment: Railway via Docker + start.py
- Run: `python start.py` or `cd backend && python -m uvicorn app.main:app --host 0.0.0.0 --port 8000`

### Google Sheets Add-on
- Entry: `sheets-addon/Code.js`
- Functions: `BCB()`, `FOCUS()`, `B3()`, `TESOURO()`
- UI: Custom menu + sidebar for configuration
- Deploy: Google Apps Script platform
- Test: Create spreadsheet → Use custom functions

### Data Sources
- **BCB:** Banco Central do Brasil SGS API
- **Focus:** BCB Focus API (market expectations)
- **B3:** Yahoo Finance API (stock prices)
- **Tesouro:** Tesouro Direto API (government bonds)

### Key Commands
```bash
# Backend Development
cd backend && python -m uvicorn app.main:app --reload --port 8000

# Test API Endpoints
curl http://localhost:8000/v1/health
curl http://localhost:8000/v1/bcb/selic
curl http://localhost:8000/v1/b3/PETR4

# Deploy to Railway
# Use Railway dashboard or railway CLI with existing Dockerfile + start.py

# Google Apps Script
# Manual deployment via script.google.com
# Upload Code.js, Menu.js, Sidebar.html, appsscript.json
```

### Environment
- Railway deployment handles PORT automatically
- API keys for external services (BCB, Focus, etc.) via environment variables
- CORS enabled for Google Sheets integration
- Rate limiting implemented per IP/API key

### Current Deployment
- **API Backend:** Railway (Docker) - https://brazilfinance-production-xxxx.up.railway.app
- **Landing Page:** GitHub Pages - https://tiagoclaw.github.io/brazilfinance/
- **Sheets Add-on:** Needs Google Apps Script deployment

### MVP Priority (Week 1-4)
1. **Week 1:** Deploy Google Apps Script publicly + update landing page CTAs
2. **Week 2:** Add user authentication + API keys + onboarding
3. **Week 3:** Integrate Stripe billing + user dashboard  
4. **Week 4:** Analytics + growth features + SEO optimization

### Business Context
- **Target:** Brazilian economists, analysts, finance professionals
- **Problem:** 5+ hours/week manual data collection from BCB/Focus/B3
- **Solution:** Google Sheets formulas for instant data access
- **Pricing:** Freemium (R$ 0 → R$ 39/mês → R$ 149/mês)
- **Market:** 9,300+ finance professionals in Brazil
- **Goal:** R$ 16M ARR in 5 years, seed funding ready