-- ====================================
-- 04_customer_segment_analysis.sql
-- Customer Segment Analysis
-- ====================================

-- Contract + Payment Method
-- Which contract and payment combinations are most at risk?

SELECT
    Contract,
    PaymentMethod,
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
GROUP BY Contract, PaymentMethod
HAVING COUNT(*) >= 50
ORDER BY churn_rate DESC;


-- Contract + Internet Service + Payment Method
-- Which customer profiles have the highest churn risk?

SELECT
    Contract,
    InternetService,
    PaymentMethod,
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
GROUP BY Contract, InternetService, PaymentMethod
HAVING COUNT(*) >= 50
ORDER BY churn_rate DESC;