# 🏥 Hospital Executive Dashboard – Power BI

An interactive multi-page Hospital Analytics Dashboard built using Power BI to analyze patient trends, medical risk factors, and financial performance.

---

## 📊 Project Overview

This dashboard provides insights into:

- Patient demographics
- Medical condition trends
- Admission types & test results
- Revenue distribution
- Billing patterns

Designed as an executive-level reporting solution with clean UI and structured navigation.

---

## 🗂 Dashboard Pages

### 🟦 Page 1 – Executive Overview
- Total Patients
- Total Revenue
- Avg Billing
- Emergency %
- Abnormal %
- Patients by Age Group
- Revenue by Admission Type
- Gender Distribution
- Top 5 Medical Conditions

### 🟦 Page 2 – Medical & Risk Analysis
- Condition vs Revenue
- Condition vs Test Result (100% Stacked)
- Age Group vs Condition (Matrix)
- Admission Type vs Test Result

### 🟦 Page 3 – Financial Deep Dive
- Revenue by Gender
- Billing vs Medication
- Revenue by Blood Type
- Billing Distribution (Histogram)

---

## 🛠 Tools & Technologies

- Power BI Desktop
- DAX (Data Analysis Expressions)
- Power Query
- Data Modeling
- Interactive Page Navigation

---

## 🧠 Key Measures (DAX)

```DAX
Total Revenue = SUM(HospitalData[Revenue])

Emergency % =
DIVIDE(
    CALCULATE(COUNT(HospitalData[Admission Type]), 
    HospitalData[Admission Type] = "Emergency"),
    COUNT(HospitalData[Admission Type])
)
