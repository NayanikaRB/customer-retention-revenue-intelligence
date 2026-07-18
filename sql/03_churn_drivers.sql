-- ====================================
-- 03_churn_drivers.sql
-- Churn Driver Analysis
-- ====================================

-- Churn by Contract
-- Does contract length influence churn?

SELECT
    Contract,
    COUNT(*) AS customers,
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
GROUP BY Contract
ORDER BY churn_rate DESC;


-- Churn by Internet Service
-- Does internet service influence churn?

SELECT
    InternetService,
    COUNT(*) AS customers,
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
ORDER BY churn_rate DESC;


-- Churn by Payment Method
-- Does payment behavior influence churn?

SELECT
    PaymentMethod,
    COUNT(*) AS customers,
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
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;


-- Churn by Tech Support
-- Does access to tech support reduce churn?

SELECT
    TechSupport,
    COUNT(*) AS customers,
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
GROUP BY TechSupport
ORDER BY churn_rate DESC;


-- Churn by Tenure Group
-- At what stage of the customer lifecycle is churn highest?

SELECT
    TenureGroup,
    COUNT(*) AS customers,
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
GROUP BY TenureGroup
ORDER BY churn_rate DESC;