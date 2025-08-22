# Healthcare dbt — Readmissions & Encounters

Clean, tested dbt project for healthcare analytics. Models EHR encounters into semantic layers and derives **30-day readmission labels**, with CI and auto-published **dbt docs** (lineage graph).

## Why it matters
Avoidable readmissions impact quality metrics and cost. A trustworthy semantic layer enables analytics and downstream ML.

## What’s inside
- Sources → Staging → Intermediate → Marts
- Freshness checks & tests
- CI (dbt build) + **Docs** published to GitHub Pages

## Quick start (DuckDB demo)
```bash
pip install dbt-core dbt-duckdb
dbt deps
dbt build
dbt docs generate
dbt docs serve
