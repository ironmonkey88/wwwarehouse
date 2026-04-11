# Skill: Observability Design (Factory Metrics) 🏛️

## Objective
Design the schema and thresholds for project-level observability, ensuring the factory remains lean and performant.

## Tactical Instructions

### 1. Metric Definition
- Define the "Gordon SLA": What constitutes "On-Time" and "Clean" for our Knowledge Products.
- Specify the grain for Token tracking (e.g., tokens per Bead, tokens per Persona).

### 2. Threshold Governance
- Design the "Red Alert" criteria for query performance (e.g., >10s latency for Gold-layer reads).
- Vet all DataOps scripts for alignment with ADR-005 (Laptop Independence).

### 3. Telemetry Integration
- Oversee the integration of Oxygen (oxy.tech) with factory logs for autonomous diagnostic discovery.
