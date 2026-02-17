# Air-Cargo-Analysis
This project focuses on analyzing air cargo operations using MySQL. It includes database creation, passenger segmentation, revenue analysis, route performance evaluation, window functions, indexing optimization, rollup summaries, views, and stored procedures for business insight generation.
🎯 Business Objectives

Analyze passenger movement across flight routes
Evaluate Business Class revenue contribution
Identify high-value customers
Monitor airline brand usage (e.g., Emirates)
Track aircraft-level performance metrics
Optimize query performance using indexing

🔎 Key Analytical Tasks Performed

📊 Revenue Analysis

Calculated total Business Class passengers and revenue
Implemented conditional revenue threshold logic (>10,000)
Generated customer-level ticket revenue summaries

👥 Customer Insight

Identified airline-specific passengers (Emirates)
Retrieved full customer profiles using JOIN operations
Segmented customers based on travel class

🛫 Route & Aircraft Performance

Analyzed passenger traffic between Route IDs 1–25
Calculated aircraft-level average travel distance
Computed average passengers per route
Used nested queries with HAVING clause for multi-departure routes

📈 Advanced SQL Implementation

Window Functions (OVER PARTITION BY) for max ticket price per class
GROUP BY with ROLLUP for hierarchical revenue summaries
Subqueries for dynamic customer filtering
View creation for Business Class segmentation
Stored Procedure execution for high-value customers

⚡ Performance Optimization
Created index on route_id
Used EXPLAIN to analyze query execution plans
Improved filtering efficiency

🔐 Database Security

Created new database users
Granted execution privileges for controlled access
