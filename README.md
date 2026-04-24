# Customer Support Quality Analysis

## Business Question
Are we resolving customer issues effectively, and where are the biggest failure points in our support operation?

## Project Overview
Analysis of 8,469 customer support tickets to identify CSAT drivers, channel performance, and product-level failure points. Built using Python, SQL and Excel.

## Tools Used
- **Python** — data cleaning, EDA, visualisations (pandas, matplotlib, seaborn)
- **SQL** — SQLite queries for channel, product and ticket type performance
- **Excel** — summary dashboard with KPIs, charts and findings

## Key Findings
1. Fitbit Versa Smartwatch has the lowest CSAT score (2.54) across all products
2. Dell XPS has the lowest resolution rate at 25.9% despite already low satisfaction scores
3. Chat is the highest performing channel with a CSAT of 3.08
4. Refund Requests score lowest by ticket type (2.93) — customers are already unhappy before contact
5. Cancellation Requests have the lowest resolution rate at 30.4%

## Recommendations
1. Investigate Fitbit Versa support process — dedicated handling may improve satisfaction
2. Review Dell XPS ticket routing — low resolution rate suggests tickets are getting stuck
3. Shift more customer contact toward Chat where satisfaction is consistently highest

## Data Limitations
- Dataset is synthetic — distributions are artificially flat which limits variance in findings
- No ticket creation timestamp available — resolution time analysis was not possible
- No agent ID column — individual agent performance could not be assessed

## Dataset
Customer Support Ticket Dataset — Kaggle (8,469 rows, 17 columns)

## Project Structure
customer-support-analysis/
├── Data/
│   ├── raw/               ← original dataset
│   └── processed/         ← cleaned CSV files
├── notebooks/
│   └── 01_eda.ipynb       ← cleaning and EDA
├── sql/
│   └── queries.sql        ← all SQL queries
├── dashboard/
│   └── support_dashboard.xlsx
└── README.md