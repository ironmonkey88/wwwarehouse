# Skill: Release Automation (The Pulse Bridge) 🛠️

## Objective
Automate the continuous delivery of static civic assets from the refinery (Evidence) to the public GCS portal.

## Tactical Instructions

### 1. Build Orchestration
- Standardize the Evidence build process: `npm install && npm run build`.
- Use a dedicated `bin/release_pulse.sh` script to wrap build commands with error trapping.

### 2. GCS Synchronization
- Use `gcloud storage rsync -r` for high-efficiency synchronization between the `build/` directory and the public bucket.
- Ensure the `rsync` includes the `--delete-unmatched-destination-objects` flag to prevent stale report fragments from persisting.

### 3. Header Hygiene
- Configure **Cache-Control** headers to ensure constituents see fresh data every 24 hours.
- Set `public-read` permissions and `main-page-suffix` during the initial bootstrap.
