# 🛒 E-Commerce Data Pipeline & Analytics Dashboard

> End-to-end data pipeline project using Python, MySQL, and Power BI
> Built on real-world Brazilian E-Commerce data (Olist Dataset)

---

## 📌 Project Overview

This project demonstrates a complete data engineering and analytics 
pipeline — from raw CSV files to an interactive Power BI dashboard 
with business insights.

**Dataset:** Olist Brazilian E-Commerce (Kaggle) — 100K+ real orders

---

## 🐍 Phase 1 — Data Cleaning (Python)

**File:** `notebooks/SQL_Project_Cleaning.ipynb`

**What was cleaned:**
- Removed nulls and duplicates
- Converted date columns from text → datetime
- Standardized city names to lowercase
- Removed invalid prices (price ≤ 0)
- Added calculated columns:
  - `delivery_days` = delivered date - purchase date
  - `total_revenue` = price + freight value

**Tables loaded to MySQL:**
- `customers` — 99,441 rows
- `orders` — 99,441 rows
- `items` — 112,650 rows

---

## 🗄️ Phase 2 — SQL Analysis (MySQL)

**File:** `sql/queries.sql`

### Query 1 — Monthly Revenue Trend
```sql
SELECT YEAR(...), MONTH(...), SUM(price), COUNT(order_id)
FROM orders JOIN items ON order_id
GROUP BY year, month
```
**Insight:** November 2017 was peak revenue month (1M+)

---

### Query 2 — Top 10 Products by Revenue
**Insight:** High-price products generate more revenue 
than high-volume cheap products

---

### Query 3 — Customer Retention Analysis
**Insight:** 90%+ customers made only 1 purchase — 
low retention problem identified

---

### Query 4 — Delivery Performance by State
**Insight:** SP delivers in 8.3 days vs RR at 29 days — 
3x difference in delivery speed

---

### Query 5 — Cancellation Analysis
**Insight:** 625 cancelled orders = 87K+ revenue loss

---

## 📊 Phase 3 — Power BI Dashboard

**File:** `dashboard/Ecommerce_Dashboard.pbix`

**Features:**
- Dynamic title — updates based on Year + State filter
- Revenue Forecast — 3 month ML prediction
- 4 KPI Cards — Revenue, Orders, Delivery Days, Cancellations
- Interactive Slicers — Year and State filters
- Brazil Map — revenue by state
- 6 Charts — line, bar, donut, horizontal bar, map

**Key Metrics:**
---

## 🏗️ Architecture
Raw CSV (Kaggle)
↓
Python (pandas) — Clean & Transform
↓
MySQL Database — Store & Query
↓
Power BI — Visualize & Analyze


---

## 🔧 Tech Stack

| Tool | Purpose |
|------|---------|
| Python (pandas) | Data cleaning & ETL |
| SQLAlchemy + PyMySQL | Python → MySQL connection |
| MySQL | Data storage & SQL analysis |
| Power BI | Interactive dashboard |
| DAX | Dynamic measures & KPIs |

---

## 📁 Project Structure

ecommerce-data-pipeline/
│
├── data/
│   └── raw/                    ← Kaggle CSV files
│
├── notebooks/
│   └── SQL_Project_Cleaning.ipynb  ← Python ETL pipeline
│
├── sql/
│   └── queries.sql             ← 5 analytical SQL queries
│
├── dashboard/
│   └── Ecommerce_Dashboard.pbix ← Power BI dashboard
