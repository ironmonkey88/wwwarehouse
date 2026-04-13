# ADR-010: Councilor Data Join Strategy 🏛️

## Status
Proposed

## Context
We need to map 1.16M 311 tickets to the official 2026 Somerville City Council. The 311 dataset provides a `ward` string/integer (e.g., "Ward 1", "1", "WARD1").

## Decision
We will use a **Standardized Ward Surrogate Key** (Integers 1-7) to join the datasets. 

## Rationale
1. **Consistency**: Both the 311 dataset and the Councilor JSON provide Ward identifiers. 
2. **Performance**: Joining on an Integer ID in DuckDB is the most efficient operation for 1M+ rows.
3. **Political Grain**: "At-Large" councilors will be treated as secondary dimensions (joined to all wards) in the Gold layer, while Ward-specific councilors will be 1:1.

## Consequences
- Tickets without a valid Ward ID will be excluded from "Councilor Productivity" metrics but remain in the global 311 Profiling.
- The `dim_wards` table becomes our "Political Mapping" SSOT.
