# REQ-001: 311 Ward Enrichment 🏮

## 🎯 Description
Connect the 1.16 million Somerville 311 tickets to the official City Ward boundaries to enable ward-level performance analysis and councilor accountability.

## ✅ Acceptance Criteria
- [ ] AC-1: Ingest official Somerville Ward Boundaries (7 Wards).
- [ ] AC-2: Perform a Point-in-Polygon (PiP) join between 311 ticket coordinates and Ward polygons.
- [ ] AC-3: Generate a Silver-layer model `fct_311_enriched` containing `ward_id`, `ward_name`, and `councilor_name`.
- [ ] AC-4: Mapping accuracy > 95% for all tickets with valid Lat/Long.

## 🚫 Out of Scope
- [ ] Real-time ingestion (Batch only).
- [ ] Precise address normalization (use existing Lat/Long).

## ❓ Open Questions
- [ ] How to handle tickets that fall slightly outside city boundaries (Buffer join?)
