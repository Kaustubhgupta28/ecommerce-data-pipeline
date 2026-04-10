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
