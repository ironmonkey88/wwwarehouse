# Skill: Spatial Logic (Geo-Enrichment) 🛰️

## Objective
Match raw records to geographic boundaries (Wards, Neighborhoods) using Python.

## Tactical Instructions

### 1. Data Prep
- Load geo-assets (Shapefiles, GeoJSON) into a GeoDataFrame using `geopandas`.
- Coordinate Reference System (CRS) MUST be `EPSG:4326` for lat/long matching.

### 2. The Point-in-Polygon (PiP) Join
- Convert raw coordinates into `Point` objects.
- Use `sjoin` (spatial join) to find which polygon (Ward) contains the point.
- Handle "Non-Matches" by logging them to a `failed_geocodes.csv` for human review.

### 3. DuckDB Integration
- If possible, use the `duckdb_spatial` extension to perform PiP joins directly in the database for large datasets (>1M rows).

## Validation Handshake
- **Proof**: Generate a sample plot of the matched data to verify ward alignment.
EOF && \
cat << 'EOF' > factory/skills/python-sovereignty/SKILL.md
# Skill: Python Sovereignty (Portable Binaries) 🐍

## Objective
Guarantee absolute portability and reliability of Python code across all environments.

## Tactical Instructions

### 1. Binary Integrity
- EVERY script must start with `#!/usr/bin/env python3`.
- NEVER refer to `/usr/local/bin/python` or similar absolute paths.

### 2. Isolation (Virtualenvs)
- Use a local `.venv` for every major ingestion module.
- Requirements MUST be exported to `requirements.txt` with pinned versions (`pkg==1.2.3`).

### 3. Execution Sovereignty
- Logs MUST be redirected to `logs/ingestion.log` or streamed with structured metadata.
- Use `argparse` for all CLI overrides; no hardcoded "modes" in the code.

## Validation Handshake
- **Handshake**: Run `bin/check_laptop_leaks.sh` on the script to ensure no path leaks exist.
