# 🥇 SOP-004: Plating a Knowledge Product (BI)

This procedure defines the "Wong Way" for delivering a new **Knowledge Product** (certified dashboard) to Gordon and his analysts.

---

## 🍽 1. Data Plating (Evidence/Lightdash)
A Knowledge Product is the **"Food"** our factory produces. It must be clean, fast, and reliable.

*   **Tools**: **Evidence.dev** (Static Pre-rendering) or **Lightdash** (Interactive Exploration). 
*   **The Golden Rule**: No dashboard is public before it is certified.

## 🛡 2. The Visual Certification (Proof Section)
**Every Knowledge Product must include a footer "Proof Section" at the bottom.**

*   **Requirement**: A visible "Certification Score" (e.g., 98/100, "Clean Data Guaranteed").
*   **Proof Points**:
    - **Freshness**: "Data last refreshed 6 hours ago."
    - **Integrity**: "12/12 data quality tests passed."
    - **Provenance**: A link to the **dbt-docs** lineage graph showing the "Proof of Origin" for all figures.
*   **Action**: If a dashboard shows **red indicators** in its Proof Section, it is "Unsafe for Production Usage."

## 🚀 3. Publishing & Monitoring
1.  **Peer Review**: Every Knowledge Product must be reviewed for metric consistency against **Cube**.
2.  **Alert Synchronization**: Dashboards must be linked to a **Slack Alert Channel** for any "Damaged Product" (Test Failure) events.
3.  **The Bead Close**: Only once the Proof Section is live and the data is verified can the tracking **Bead** be closed.

---
*Created by the Wong Way Assistant | April 2026*
