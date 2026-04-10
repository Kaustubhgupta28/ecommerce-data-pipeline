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
Total Revenue     → 15.84M
Total Orders      → 99,441
Avg Delivery Days → 12.09
Cancelled Orders  → 625

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


---

## 💡 Key Business Insights

1. **SP dominates** — Sao Paulo generates 5.2M (33% of total revenue)
2. **Delivery gap** — Remote states face 3x longer delivery times
3. **Low retention** — 90%+ customers never return after first purchase
4. **Peak season** — May and November show highest revenue spikes
5. **97% success** — 97% of orders are successfully delivered

---

## 🚀 How to Run

### 1. Clone the repo
```bash
git clone https://github.com/yourusername/ecommerce-data-pipeline
```

### 2. Install dependencies
```bash
pip install pandas sqlalchemy pymysql
```

### 3. Download dataset
👉 https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

### 4. Setup MySQL
```sql
CREATE DATABASE ecommerce_project;
```

### 5. Run the notebook

Open notebooks/SQL_Project_Cleaning.ipynb
Update MySQL password in create_engine()
Run all cells

### 6. Open Dashboard
Open dashboard/Ecommerce_Dashboard.pbix in Power BI Desktop
Refresh data connection

---

## 📸 Dashboard Preview

![Dashboard](dashboard/preview.png)

---

## 🙋 Author

**Kaustubh Gupta**
- LinkedIn: https://www.linkedin.com/in/kaustubh-gupta-498b7a273/
- GitHub: https://github.com/Kaustubhgupta28



<img width="1729" height="868" alt="image" src="https://github.com/user-attachments/assets/01a14281-8d31-45b3-b4d2-cc4b741a0e94" />

---

⭐ If you found this useful, please star the repo!
