-- ====================================
-- 05_retention_opportunities.sql
-- Retention Opportunity Analysis
-- ====================================

-- Revenue at Risk by Customer Segment
-- Which customer segments should be prioritized for retention efforts?

SELECT
    Contract,
    InternetService,
    PaymentMethod,

    COUNT(*) AS customers,

    ROUND(SUM(MonthlyCharges),2) AS revenue,

    ROUND(
        SUM(MonthlyCharges) *
        AVG(
            CASE
                WHEN Churn='Yes' THEN 1
                ELSE 0
            END
        ),
        2
    ) AS estimated_revenue_at_risk

FROM `my-bigquery-project-458621.telecom_analytics.customer_churn_python`

GROUP BY
    Contract,
    InternetService,
    PaymentMethod

HAVING COUNT(*) >= 50

ORDER BY estimated_revenue_at_risk DESC;