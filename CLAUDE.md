# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Educational coursework repository (Russian-language curriculum) organized by technology. Each subject has numbered checkpoints (CP1, CP2, ...) representing progressive assignments. All content (UI text, comments, variable names) is in Russian.

## Repository Structure

Organized by technology at the top level, each with checkpoint subdirectories:

- **Algorithms/** — Algorithm fundamentals (PDF assignments, text results)
- **DataBase/** — SQL (PostgreSQL, MySQL): schema design, RBAC, indexing (CP1-CP3)
- **JS DOM/** — Browser DOM manipulation with vanilla JS, ES6 modules (CP1-CP3)
- **Node.js/** — CommonJS modules, HTTP server, CLI tools (CP1-CP2)
- **Python/** — Procedural scripts (CP1-CP3), Flask web apps (CP4-CP7)
- **TypeScript/** — OOP: classes, inheritance, encapsulation (CP1)
- **XML/** — DTD (CP1), XSD (CP2), XSLT/XPath (CP3)

## Running Code by Technology

### Python
```bash
# Simple scripts (CP1-3) — entry points are T1.py, T2.py, etc.
python3 Python/CP1/T1.py

# Flask apps (CP4-7) — each has its own venv
source Python/CP5/venv/bin/activate
python3 Python/CP5/app.py        # http://localhost:5000

# CP7 requires DB setup before first run
source Python/CP7/venv/bin/activate
python3 Python/CP7/create_db.py  # seeds SQLite database (instance/games.db)
python3 Python/CP7/app.py        # http://localhost:5001
```

### JavaScript (DOM)
Open HTML files directly in a browser. CP2 uses ES6 modules (`type="module"`), so it must be served over HTTP:
```bash
cd "JS DOM/CP2"
python3 -m http.server 8000
# Then open http://localhost:8000
```

### Node.js
```bash
node Node.js/CP1/sayHello.js YourName   # CLI argument required
node Node.js/CP2/app.js                  # HTTP server on http://localhost:3000
```

### TypeScript
```bash
npx tsc TypeScript/CP1/User.ts && node TypeScript/CP1/User.js
```

### SQL (Database)
CP3 targets PostgreSQL. Run the setup procedure first, then test queries:
```bash
psql -f DataBase/CP3/structure_create.sql
psql -f DataBase/CP3/test_queries.sql
# To reset: psql -f DataBase/CP3/structure_recreate.sql
```

### XML
XML files include DTD (CP1), XSD (CP2), and XSLT/XPath (CP3). Validate with any XML processor or open in a browser.

## Flask App Architecture (CP4-CP7 Progression)

- **CP4:** Single-file app, inline HTML response
- **CP5:** Jinja2 template inheritance (`base.html` → `index.html`)
- **CP6:** Bootstrap 5 + static files (`static/custom.css`), flash messages, navbar
- **CP7:** SQLAlchemy ORM with SQLite — 3 models (`Studio`, `Series`, `Game`) with foreign key relationships. Uses `create_db.py` to seed data.

Template pattern (CP5+): `templates/base.html` defines layout, child templates use `{% extends 'base.html' %}` with `{% block content %}`.

## Database Schema (CP3)

17 tables modeling a university management system: departments, disciplines, employees, students, schedules. 32 indices. 5 RBAC roles (rl_architect, rl_teacher, rl_student, rl_managersd, rl_administrator). Two stored procedures: `Structure_Create()` and `Structure_Re_Create()`.

## Conventions

- **Commit messages** follow: `TECHNOLOGY CPX Status` (e.g., `PYTHON CP7 Complete`, `DB CP3 Upd`)
- **All work is on `main` branch** — no branching strategy
- **No CI/CD, no test framework, no root-level package manager** — each checkpoint is self-contained
- **Python venvs** exist inside individual checkpoint directories (not at root), Python 3.9
- **Script naming:** Tasks are `T1.py`/`T2.py`/etc. for scripts; `app.py` for Flask apps
- **Path note:** "JS DOM" directory has a space in the name — quote paths when using shell commands
- **Node.js uses only built-in modules** (http, os) — no npm dependencies
