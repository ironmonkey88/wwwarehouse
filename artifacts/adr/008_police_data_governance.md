# ADR 008: Integration of Somerville Police Incident Data 🏮

## Status
Proposed -> Approved (Simulation Strike Team)

## Context
The Somerville Civic Pulse requires visibility into public safety trends. Police incident data contains sensitive fields (Officer names, specific addresses) that must be governed to protect privacy while enabling ward-level analysis.

## Decision
We are integrating the Police Incident source with the following constraints:

### 1. Privacy First
- All PII (Officer names, specific house numbers) MUST be hashed at the **Silver Layer**.
- Addresses will be generalized to the **Ward Level** only in the Gold layer.

### 2. Engineering Standards
- **Ingestion**: Use `dlt` for automated schema evolution.
- **Transformation**: Medallion flow (Bronze -> Silver -> Gold).
- **Delivery**: Evidence.dev dashboard with a mandatory SOP-004 Proof Section.

## Implications
- **Assembler**: Must implementation the Hashing logic in the ELT pipeline.
- **Refiner**: Must build unit tests to verify PII masking.
- **Artisan**: Must cross-check the "Incident Totals" against the raw Bronze count.

## Validation Handshake
- **Witness**: Verify PII masking in the Gold layer via SQL probe.
