#!/bin/bash
# factory/bin/publish_portal.sh: The Sovereign Portal Launcher 🚀
# Triggers a cloud-resident build and deployment of Evidence + dbt Docs.

set -e

PROJECT_ID=$(gcloud config get-value project)
echo "🪐 Project detected: ${PROJECT_ID}"

echo "🏗️ Phase 1: Initiating Sovereign Cloud Build..."
echo "This will build the refinery, generate dbt docs, compile Evidence, and deploy to Firebase."
echo "-----------------------------------------------------------------------------------"

gcloud builds submit --config cloudbuild.yaml .

echo "-----------------------------------------------------------------------------------"
echo "✅ Cloud Build Initiated. You can monitor progress at:"
echo "https://console.cloud.google.com/cloud-build/builds?project=${PROJECT_ID}"

echo "🚀 Once complete, your portal will be live at: https://civicpulse.thewongway.co"
