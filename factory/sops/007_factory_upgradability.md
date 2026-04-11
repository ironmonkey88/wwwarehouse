# 📈 SOP-007: Factory Upgradability (Scaling Strategy)

This procedure defines the "Wong Way" for **scaling up** the **WWWarehouse Data Factory** as the assembly lines grow in volume or complexity.

---

## 📈 1. Scaling Ingestion (dlt)
*   **Serverless Start**: Standard dlt Python scripts running in **Cloud Run Jobs** ($0 Idle).
*   **Standard Scale**: Use **dlt with ConnectorX** to parallelize across multiple CPU cores.
*   **Dedicated Scale**: Move the ingestion script to a **dedicated Compute Engine instance** or a **GKE cluster** for 24/7 high-volume CDC.

## 🥇 2. Scaling Transformation (dbt)
*   **Serverless Start**: `dbt-duckdb` reading Parquet files from **GCS**.
*   **Standard Scale**: Attach **MotherDuck** as the persistent warehouse for higher query concurrency.
*   **Enterprise Scale**: Switch the dbt adapter to **BigQuery**. Because our models use standard SQL and the Medallion pattern, the logic remains 95% the same.

## 🥈 3. Scaling Semantic Layer (Cube)
*   **Serverless Start**: **Cube Core (OSS)** running in a Cloud Run Job, refreshing pre-aggregations on a schedule.
*   **Dedicated Scale**: Deploy Cube to a **persistent GKE cluster** with a dedicated **Cube Store** database for sub-second latency on large datasets.

## 🖼 4. Scaling Consumption (BI)
*   **Serverless Start**: **Evidence.dev** static site (GCS static assets, zero compute).
*   **Dedicated Scale**: **Lightdash** running on a **dedicated GCP VM** for real-time interactive exploration and drill-downs.

---
*Created by the Wong Way Assistant | April 2026*
