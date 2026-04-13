# ADR-009: Spatial Join Strategy for Large Datasets 🏛️

## Status
Proposed

## Context
We need to enrich 1.16 million Somerville 311 tickets with Ward boundary data. Performing this join in Python (via GeoPandas) would require loading 1M+ rows into memory, which violates our **Frugality** and **Latency** mandates.

## Decision
We will use the **DuckDB Spatial Extension** to perform the Point-in-Polygon (PiP) join directly in the warehouse.

## Rationale
1. **Performance**: DuckDB Spatial uses a vectorized engine that can join 1M points to 7 polygons in < 1 second.
2. **Portability**: No external Python dependencies required in the production pipeline beyond a basic DuckDB install.
3. **Lineage**: The join logic is stored in SQL (`dbt` model), maintaining the "Lineage Mandate."

## Consequences
- The warehouse environment must have internet access to run `INSTALL spatial` or have the binary pre-cached.
- We must handle NULL or malformed coordinates in the 311 dataset gracefully.
