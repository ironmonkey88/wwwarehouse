# Skill: Gateway Architecture (Public Security) 🏛️

## Objective
Provision and maintain secure, high-performance HTTPS entry points for public civic portals using GCP Global Load Balancing.

## Tactical Instructions

### 1. Global External Load Balancing (GCLB)
- Always use the **Global External Load Balancer** (v2) for static GCS backends to ensure low-latency edge delivery.
- Use **Backend Buckets** for serving Evidence.dev static assets.
- Configure `enable_cdn = true` to minimize egress costs and improve response times.

### 2. Security & SSL
- Mandate **HTTPS Redirect** (HTTP to HTTPS) in the URL map.
- Provision **Google-Managed SSL Certificates** for custom domains (e.g., `civicpulse.somerville.io`).
- Monitor certificate status using `gcloud compute ssl-certificates describe`.

### 3. DNS Integration
- Coordinate with the user to point **A Records** to the Load Balancer's **Static External IP**.
- Use **Cloud DNS** (if available) for seamless integration with certificate provisioning.
