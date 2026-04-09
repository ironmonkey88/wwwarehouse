# Skill: Councilor Data Ingestion 🗳

This skill governs the ingestion of Somerville City Councilor datasets into the GCS Bronze layer.

## 🎯 Context Activation
Activate this skill when:
- Loading official city councilor lists.
- Managing schema mapping for political roles (President, Ward, At-Large).
- Pushing to the `bronze` dataset in the GCS Warehouse.

## 🛠 Operational Methodology
1. **Source**: Structured JSON files in `ingestion/`.
2. **Destination**: Google Cloud Storage (`warehouse-011793-factory`).
3. **Pipeline (dlt)**:
    - Pipeline Name: `councilor_info`.
    - Dataset: `bronze`.
    - Strategy: `replace` (Full snapshot for current council).
4. **Verification**:
    - `dlt pipeline councilor_info show`.
    - Verify Parquet existence in GCS.

## 🧩 Dependencies
- `dlt` with GCS extra.
- `google-cloud-storage` client.
- `factory-runner` service account credentials.
