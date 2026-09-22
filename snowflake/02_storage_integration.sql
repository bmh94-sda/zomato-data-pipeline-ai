-- A storage Integration is a Snowflake object that stores the connection details for accessing an external cloud storage location (S3, GCS, Azure Blob). Instead of embedding credentials in every stage, you create one integration and reference it across multiple stages.

USE ROLE ACCOUNTADMIN;

CREATE OR REPLACE STORAGE INTEGRATION ZOMATO_S3_INT
    TYPE = EXTERNAL_STAGE
    STORAGE_PROVIDER = 'S3'
    ENABLED = TRUE
    STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::107737161563:role/mbh-snowflake-s3-role'
    STORAGE_ALLOWED_LOCATIONS = ('s3://mbh-zomato-pipeline-dl/');

GRANT USAGE ON INTEGRATION ZOMATO_S3_INT TO ROLE DBT_ROLE;

DESC INTEGRATION ZOMATO_S3_INT;

