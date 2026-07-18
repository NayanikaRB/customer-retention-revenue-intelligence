-- ====================================
-- 01_executive_overview.sql
-- Executive Overview KPIs
-- ====================================

SELECT
    COUNT(*) AS total_customers,

    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,

    SUM(CASE WHEN Churn = 'No' THEN 1 ELSE 0 END) AS retained_customers,

    ROUND(
        100 * AVG(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END),
        2
    ) AS churn_rate,

    ROUND(
        100 * AVG(CASE WHEN Churn = 'No' THEN 1 ELSE 0 END),
        2
    ) AS retention_rate,

    ROUND(SUM(MonthlyCharges), 2) AS total_monthly_revenue,

    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN MonthlyCharges ELSE 0 END),
        2
    ) AS revenue_at_risk,

    ROUND(
        100 * SUM(CASE WHEN Churn = 'Yes' THEN MonthlyCharges ELSE 0 END)
        / SUM(MonthlyCharges),
        2
    ) AS revenue_at_risk_percentage,

    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charge,

    ROUND(AVG(tenure), 2) AS avg_tenure_months

FROM `my-bigquery-project-458621.telecom_analytics.customer_churn_python`;