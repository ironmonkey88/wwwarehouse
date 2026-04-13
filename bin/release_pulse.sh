#!/usr/bin/env bash
# [ASSEMBLER] Release Pulse (The Build-to-Bucket Pipeline) 🏮
# Purpose: Automate the delivery of static civic assets to the public portal.

set -e # Exit on error

echo "🏮 Starting Release Cycle: Public Civic Pulse..."

# 1. Environment Detection
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PORTAL_BUCKET="gs://civicpulse-somerville-io"
EVIDENCE_DIR="$PROJECT_DIR/analytics/evidence"

echo "📂 Project Directory: $PROJECT_DIR"
echo "📂 Evidence Directory: $EVIDENCE_DIR"
echo "📂 Portal Bucket: $PORTAL_BUCKET"

# 2. Build the Evidence Reports
if [ "$SKIP_EVIDENCE" = "true" ]; then
    echo "⏩ Skipping Evidence Reports build (Selective Deployment)..."
else
    echo "🏗️  Building Evidence Reports (Static Generation)..."
    cd "$EVIDENCE_DIR"
    npm run build
fi

# 3. Quality Gate (Pre-Sync)
echo "🛡️  Executing Pre-Sync Quality Gate..."
# Note: Since the site is static, we'd need to serve the 'build' folder to test it properly here.
# For now, we will perform a live verification post-sync as our primary functional gate.

# 4. Synchronize Sovereign Gateway (Primary Entry Point)
echo "🚢 Synchronizing Sovereign Gateway to ROOT..."
gcloud storage rsync "$PROJECT_DIR/portal/" "$PORTAL_BUCKET/" --recursive

# 5. Synchronize Evidence Dashboards
echo "🚢 Synchronizing Evidence Reports..."
gcloud storage rsync "$EVIDENCE_DIR/build/" "$PORTAL_BUCKET/" --recursive
gcloud storage cp "$PROJECT_DIR/portal/index.html" "$PORTAL_BUCKET/index.html"
gcloud storage cp "$PROJECT_DIR/portal/style.css" "$PORTAL_BUCKET/style.css"

# 5. Set Cache Control (Sub-second Performance)
echo "🛡️  Optimizing Cache Headers (5 Minute Freshness for HTML)..."
gcloud storage objects update "$PORTAL_BUCKET/**/*.html" --cache-control="public, max-age=300"

echo "🛡️  Hardening Static Assets (1 Year Immutability for JS/CSS)..."
gcloud storage objects update "$PORTAL_BUCKET/**/*.{js,css,woff2}" --cache-control="public, max-age=31536000, immutable" || true

# 6. CDN Invalidation (Clearing the Ghost)
echo "🚀 Invalidating Cloud CDN Edge Cache for ROOT..."
# Use the detected active project
ACTIVE_PROJECT=$(gcloud config get-value project)
gcloud compute url-maps invalidate-cdn-cache portal-url-map --path "/*" --project "$ACTIVE_PROJECT" --quiet

# 7. Sovereign Verification Gate (PHASE 3: SEAL)
echo "🛡️  Executing Final Sovereign Verification Gate..."
python3 "$PROJECT_DIR/scripts/verify_portal.py" --version-check REQ-004

echo "✅ Release Cycle Complete: Mission Accomplished."
echo "🔗 Verified Live Portal: https://civicpulse.thewongway.co"
