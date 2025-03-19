--------------------------
--CREATE VIEW CALENDAR
--------------------------
CREATE VIEW gamma.calendar
AS
SELECT
    * 
FROM
OPENROWSET
(
    BULK 'https://sacodeazure.dfs.core.windows.net/beta/Calender/',
    FORMAT = 'PARQUET'
) AS cal_query


--------------------------
--CREATE VIEW CUSTOMER
--------------------------
CREATE VIEW gamma.customer
AS
SELECT
    * 
FROM
OPENROWSET
(
    BULK 'https://sacodeazure.dfs.core.windows.net/beta/Customer/',
    FORMAT = 'PARQUET'
) AS cust_query


------------------------------------
--CREATE VIEW PRODUCT SUBCATEGORIES
------------------------------------
CREATE VIEW gamma.product_subcategories
AS
SELECT
    * 
FROM
OPENROWSET
(
    BULK 'https://sacodeazure.dfs.core.windows.net/beta/Product_Subcategories/',
    FORMAT = 'PARQUET'
) AS subcat_query


------------------------------------
--CREATE VIEW PRODUCTS
------------------------------------
CREATE VIEW gamma.products
AS
SELECT
    * 
FROM
OPENROWSET
(
    BULK 'https://sacodeazure.dfs.core.windows.net/beta/Products/',
    FORMAT = 'PARQUET'
) AS prod_query


------------------------------------
--CREATE VIEW RETURNS
------------------------------------
CREATE VIEW gamma.returns
AS
SELECT
    * 
FROM
OPENROWSET
(
    BULK 'https://sacodeazure.dfs.core.windows.net/beta/Returns/',
    FORMAT = 'PARQUET'
) AS return_query


------------------------------------
--CREATE VIEW SALES
------------------------------------
CREATE VIEW gamma.sales
AS
SELECT
    * 
FROM
OPENROWSET
(
    BULK 'https://sacodeazure.dfs.core.windows.net/beta/Sales/',
    FORMAT = 'PARQUET'
) AS sales_query


------------------------------------
--CREATE VIEW TERRITORIES
------------------------------------
CREATE VIEW gamma.territories
AS
SELECT
    * 
FROM
OPENROWSET
(
    BULK 'https://sacodeazure.dfs.core.windows.net/beta/Territories/',
    FORMAT = 'PARQUET'
) AS terr_query
