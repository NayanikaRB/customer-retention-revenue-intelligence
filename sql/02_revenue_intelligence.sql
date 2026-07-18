-- ====================================
-- 02_revenue_intelligence.sql
-- Revenue Intelligence Analysis
-- ====================================

-- Revenue by Churn Status
-- Which customer group contributes the most revenue?

SELECT
    Churn,
    COUNT(*) AS customers,
    ROUND(SUM(MonthlyCharges),2) AS monthly_revenue,
    ROUND(AVG(MonthlyCharges),2) AS avg_monthly_charge
FROM `my-bigquery-project-458621.telecom_analytics.customer_churn_python`
GROUP BY Churn;


-- Revenue by Contract
-- Which contract segments generate the most revenue?

SELECT
    Contract,
    COUNT(*) AS customers,
    ROUND(SUM(MonthlyCharges),2) AS revenue,
    ROUND(
        100 * AVG(
            CASE
                WHEN Churn = 'Yes' THEN 1
                ELSE 0
            END
        ),
        2
    ) AS churn_rate
FROM `my-bigquery-project-458621.telecom_analytics.customer_churn_python`
GROUP BY Contract
ORDER BY revenue DESC;


-- Revenue by Internet Service
-- Which internet service generates the most revenue?

SELECT
    InternetService,
    COUNT(*) AS customers,
    ROUND(SUM(MonthlyCharges),2) AS revenue,
    ROUND(
        100 * AVG(
            CASE
                WHEN Churn='Yes' THEN 1
                ELSE 0
            END
        ),
        2
    ) AS churn_rate
FROM `my-bigquery-project-458621.telecom_analytics.customer_churn_python`
GROUP BY InternetService
ORDER BY revenue DESC;