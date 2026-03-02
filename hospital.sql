use hospital_db;
CREATE TABLE hospital_data (
    age INT,
    gender VARCHAR(20),
    blood_type VARCHAR(5),
    medical_condition VARCHAR(100),
    billing_amount DECIMAL(10,2),
    admission_type VARCHAR(50),
    medication VARCHAR(100),
    test_results VARCHAR(50)
);

select * from hospital_data;

# Executive KPIs
#1. Total patients
 select count(*) as total_patients from hospital_data;
 
#2.Total revenue
select sum(billing_amount) as total_revenue from hospital_data;
 
# 3.Avg Billing
 select avg(billing_amount) as avg_billing from hospital_data;
 
 # 4.% Emergency Admissions
 select  count(*) as total_patients,
 (sum(CASE
 when admission_type='Emergency' Then 1
 else 0
 end)*100.0)/count(*) as emergency_percentage
 from hospital_data;
 
 # 5.Abnormal Test Result %
select 
count(*) as total_patients,
(sum(CASE
when test_results='abnormal' THEN 1
else 0
end)*100.0)/count(*) as abnormal_percentage 
from hospital_data;
 
# Revenue Insights
#1. Revenue by Admission Type
select admission_type,sum(billing_amount) as revenue from hospital_data group by admission_type;


#2.Revenue by Age Group
select 
CASE
when age<=18 THEN "Child"
when age<=35 THEN  "Young"
when age<=60 THEN "Adult"
ELSE "Old"
END as age_group,
sum(billing_amount) as revenue
from hospital_data 
group by age_group;

#3.Average Billing per Condition
select medical_condition,avg(billing_amount) as avg_billing 
from hospital_data
group by medical_condition
order by avg_billing DESC;

#Patient Insights
#1. Gender Distribution
select gender,count(gender) as gender_distribution from hospital_data group by gender;

# 2.Age Group Analysis
select count(*) as total_patients, 
CASE
when age<=18 THEN "Child"
when age<=35 THEN  "Young"
when age<=60 THEN "Adult"
ELSE "Old"
END as age_group
from hospital_data 
group by age_group;

#3.Top 5 Medical Conditions
select count(*) as total_patients,medical_condition from hospital_data group by medical_condition 
order by total_patients desc limit 5;

#Risk Insights
#1.Abnormal % by Admission Type
SELECT 
    admission_type,
    COUNT(*) AS total_patients,
    SUM(CASE 
            WHEN test_results = 'Abnormal' THEN 1 
            ELSE 0 
        END) AS abnormal_patients,
    (SUM(CASE 
            WHEN test_results = 'Abnormal' THEN 1 
            ELSE 0 
        END) * 100.0) / COUNT(*) AS abnormal_percentage
FROM hospital_data
GROUP BY admission_type;

#2.Condition vs Test Result
select medical_condition,test_results,count(*) as total_patients 
from hospital_data
group by medical_condition,test_results;

#Advanced
#1. Revenue by Admission Type + Condition
-- use coalesce to handle the null billing ---
select admission_type,medical_condition,
sum(coalesce(billing_amount,0)) as total_revenue
from hospital_data 
group by admission_type,medical_condition;

#2.Age Group Contribution to Revenue
select 
CASE
when age<=18 THEN "Child"
when age<=35 THEN  "Young"
when age<=60 THEN "Adult"
ELSE "Old"
END as age_group,
round(sum(billing_amount),2) as revenue,
round(
(SUM(billing_amount) * 100.0) / 
    (SELECT SUM(billing_amount) FROM hospital_data),2)
    AS revenue_contribution_percentage
from hospital_data 
group by age_group 
order by revenue desc;




