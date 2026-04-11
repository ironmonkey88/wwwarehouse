# Skill: PII Leak Detector (The Guardian) 🛡️

## Objective
Scan binary and text data files for accidental disclosure of sensitive identifiers.

## Tactical Instructions

### 1. The Audit Probe
- Scan the DuckDB tables or Parquet files for "Forbidden Strings" (e.g., raw house numbers, names) that should have been masked.
- Use 'grep -r' or a Python scanner to look for leaked patterns in the Gold layer.

### 2. Pattern Matching
- Check for Email addresses, Phone numbers, or specific latitude/longitude pairs that map to residential addresses.

### 3. Lockdown Logic
- If a leak is detected, the Knowledge Product is **IMMEDIATELY UNQUALIFIED**. 
- Halt the pipeline and initiate an ADR-008 Review.
