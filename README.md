# Azure Data Engineering Pipeline

## Project Overview

This project demonstrates an end-to-end data engineering pipeline using Azure Data Factory, SQL Server, Azure Data Lake Storage Gen2, Python, and SQL.

The pipeline focuses on data ingestion, transformation, data quality, incremental loading, and monitoring.

## Architecture

```text
SQL Server / CSV Files
        |
        v
Self-hosted Integration Runtime
        |
        v
Azure Data Factory
        |
        v
ADLS Gen2 - Bronze
        |
        v
Transformation
        |
        v
ADLS Gen2 - Silver
        |
        v
ADLS Gen2 - Gold
