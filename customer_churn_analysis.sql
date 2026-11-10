
-- 1. Total Customers
SELECT COUNT(*) AS Total_Customers
FROM customers;

-- 2. Customer Status
SELECT "Customer Status", COUNT(*) AS Total_Customers
FROM customers
GROUP BY "Customer Status";

-- 3. Overall Churn Rate
SELECT
    COUNT(CASE WHEN "Customer Status" = 'Churned' THEN 1 END) AS Churned,
    COUNT(CASE WHEN "Customer Status" = 'Stayed' THEN 1 END) AS Stayed,
    ROUND(
        100.0 * COUNT(CASE WHEN "Customer Status" = 'Churned' THEN 1 END) /
        COUNT(CASE WHEN "Customer Status" IN ('Stayed','Churned') THEN 1 END),
        2
    ) AS Churn_Rate
FROM customers;

-- 4. Contract-wise Churn
SELECT Contract,
       COUNT(*) AS Total_Customers,
       SUM(CASE WHEN "Customer Status"='Churned' THEN 1 ELSE 0 END) AS Churned
FROM customers
WHERE "Customer Status" IN ('Stayed','Churned')
GROUP BY Contract;

-- 5. Internet Type-wise Churn
SELECT "Internet Type",
       COUNT(*) AS Total_Customers,
       SUM(CASE WHEN "Customer Status"='Churned' THEN 1 ELSE 0 END) AS Churned
FROM customers
WHERE "Customer Status" IN ('Stayed','Churned')
GROUP BY "Internet Type";

-- 6. Payment Method-wise Churn
SELECT "Payment Method",
       COUNT(*) AS Total_Customers,
       SUM(CASE WHEN "Customer Status"='Churned' THEN 1 ELSE 0 END) AS Churned
FROM customers
WHERE "Customer Status" IN ('Stayed','Churned')
GROUP BY "Payment Method";

-- 7. Average Monthly Charges
SELECT "Customer Status", AVG("Monthly Charge") AS Average_Charge
FROM customers
WHERE "Customer Status" IN ('Stayed','Churned')
GROUP BY "Customer Status";
