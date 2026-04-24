
-- Query 1: Channel Performance
SELECT 
    "Ticket Channel",
    COUNT(*) as total_tickets,
    ROUND(AVG("Customer Satisfaction Rating"), 2) as avg_csat,
    SUM(CASE WHEN "Ticket Status" = 'Closed' THEN 1 ELSE 0 END) as resolved,
    ROUND(SUM(CASE WHEN "Ticket Status" = 'Closed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) as resolution_rate_pct
FROM tickets
GROUP BY "Ticket Channel"
ORDER BY avg_csat ASC;

-- Query 2: Ticket Type Performance
SELECT 
    "Ticket Type",
    COUNT(*) as total_tickets,
    ROUND(AVG("Customer Satisfaction Rating"), 2) as avg_csat,
    SUM(CASE WHEN "Ticket Status" = 'Closed' THEN 1 ELSE 0 END) as resolved,
    ROUND(SUM(CASE WHEN "Ticket Status" = 'Closed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) as resolution_rate_pct
FROM tickets
GROUP BY "Ticket Type"
ORDER BY avg_csat ASC;

-- Query 3: Worst Performing Products (CTE)
WITH product_stats AS (
    SELECT 
        "Product Purchased",
        COUNT(*) as total_tickets,
        ROUND(AVG("Customer Satisfaction Rating"), 2) as avg_csat,
        ROUND(SUM(CASE WHEN "Ticket Status" = 'Closed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) as resolution_rate_pct
    FROM tickets
    GROUP BY "Product Purchased"
)
SELECT *,
    RANK() OVER (ORDER BY avg_csat ASC) as csat_rank
FROM product_stats
ORDER BY csat_rank
LIMIT 10;

-- Query 4: Priority Level Analysis
SELECT 
    "Ticket Priority",
    COUNT(*) as total_tickets,
    ROUND(AVG("Customer Satisfaction Rating"), 2) as avg_csat,
    ROUND(SUM(CASE WHEN "Ticket Status" = 'Closed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) as resolution_rate_pct
FROM tickets
GROUP BY "Ticket Priority"
ORDER BY avg_csat ASC;