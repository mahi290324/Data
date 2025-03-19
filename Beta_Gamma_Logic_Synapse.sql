--to create external table
--1. credential- to access the data using manage identity
--Step1: Create a master key
Create master key password = 'Password#123'
CREATE MASTER KEY [ ENCRYPTION BY PASSWORD ='password' ]
[ ; ]

--Step 2 : Credential
CREATE DATABASE SCOPED CREDENTIAL credential_name
WITH IDENTITY = 'identity_name'
    [ , SECRET = 'secret' ]
[ ; ]
---2. external data source- We need to store data instead of giving path in url. We did not need to write URL.
CREATE EXTERNAL DATA SOURCE source_gamma
WITH
(
    LOCATION = 'https://sacodeazure.blob.core.windows.net/beta'
)

CREATE EXTERNAL DATA SOURCE source_beta
WITH
(
    LOCATION = 'https://sacodeazure.blob.core.windows.net/beta',
    CREDENTIAL = cred_ak
)

CREATE EXTERNAL DATA SOURCE source_gamma
WITH
(
    LOCATION = 'https://sacodeazure.blob.core.windows.net/gamma',
    CREDENTIAL = cred_ak
)

--3. external file format - define file format like parquet, csv, Jason

CREATE EXTERNAL FILE FORMAT format_parquet
WITH(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)

---CREATE EXTERNAL TABLE AS SELECT (CETAS)

--------------------------------------
---CREATE EXTERNAL TABLE OUT_SALES
--------------------------------------
CREATE EXTERNAL TABLE gamma.outsales
WITH(
    LOCATION = 'outsales',
    DATA_SOURCE = source_gamma,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gamma.sales

--Connection between Azure and Power BINARY_INTEGER
--We need SQL endpoint to connect pbi
--Copy serverless sql endpoint for azure synapse
--ws-azure-synapse-1-ondemand.sql.azuresynapse.net
--Goto PBI desktop-->getdata-->Azure-->azuresynapse analytics-->paste sql endpoint in server option
---Database Credential for synapse-- admin/passowrd
