#!/bin/bash
# bin/publish_docs.sh: The Sovereign Documenter 📜

set -e

PROJECT_ROOT=$(git rev-parse --show-toplevel)
DBT_DIR="${PROJECT_ROOT}/transformation/dbt"
TARGET_DIR="${DBT_DIR}/target"
PUBLISH_DIR="${PROJECT_ROOT}/docs/publishing_docs"
BUCKET_NAME="docs-011793-factory"

mkdir -p "${PUBLISH_DIR}"

echo "🏗️ Phase 1: Generating dbt Documentation..."
cd "${DBT_DIR}"
../../.venv/bin/dbt docs generate --profiles-dir .

echo "🧭 Phase 1.5: Staging Architectural Blueprints (ERD & JSON)..."
cp "${PROJECT_ROOT}/docs/ERD.md" "${PUBLISH_DIR}/"
cp "${TARGET_DIR}/manifest.json" "${PUBLISH_DIR}/"
cp "${TARGET_DIR}/catalog.json" "${PUBLISH_DIR}/"

echo "📦 Phase 2: Bundling Documentation into a Staging Area..."
python3 <<EOF
import json
import os

target = "${TARGET_DIR}"
publish = "${PUBLISH_DIR}"
with open(os.path.join(target, 'index.html'), 'r') as f:
    content = f.read()

with open(os.path.join(target, 'manifest.json'), 'r') as f:
    manifest = json.load(f)

with open(os.path.join(target, 'catalog.json'), 'r') as f:
    catalog = json.load(f)

# Embed pieces into the index.html template
manifest_str = 'r=' + json.dumps(manifest)
catalog_str = 'c=' + json.dumps(catalog)
new_content = content.replace('r={}', manifest_str).replace('c={}', catalog_str)

with open(os.path.join(publish, 'index.html'), 'w') as f:
    f.write(new_content)
EOF

echo "🚀 Deploying to Sovereign Firebase Portal (HTTPS)..."
firebase deploy --only hosting
echo "✅ Documentation Live at: https://civicpulse.thewongway.co"
echo "🌐 Public Domain Alias: civicpulse.thewongway.co"
