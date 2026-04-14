import os
import sys
from pathlib import Path

def verify_ui_integrity():
    """Certified Verification of Evidence Build Artifacts (Sovereign Shield)"""
    
    root = Path("/Users/gordonwong/WWWarehouse")
    build_dir = root / "analytics/evidence/build"
    data_dir = build_dir / "data/civic_pulse"
    
    print("🏮 Initiating UI Integrity Verification...")
    
    # Check 1: Base Build Directory
    if not build_dir.exists():
        print(f"❌ ERROR: Build directory missing at {build_dir}")
        return False
    
    # Check 2: Index Artifact
    index_file = build_dir / "index.html"
    if not index_file.exists():
        print("❌ ERROR: index.html missing from build")
        return False
    print(f"✅ index.html verified ({os.path.getsize(index_file)} bytes)")
    
    # Check 3: Data Layer Presence
    critical_artifacts = [
        "type_distribution.parquet",
        "ward_distribution.parquet",
        "daily_volume.parquet",
        "monthly_performance.parquet"
    ]
    
    missing_artifacts = []
    for art in critical_artifacts:
        # Search anywhere in data_dir (Evidence aliases can nest them)
        found = list(data_dir.glob(f"**/{art}"))
        if not found:
            missing_artifacts.append(art)
    
    if missing_artifacts:
        print(f"❌ ERROR: Missing critical dashboard artifacts: {', '.join(missing_artifacts)}")
        return False
    
    print(f"✅ Data layer certified. All {len(critical_artifacts)} critical dashboard artifacts are present.")
    
    print("🏮 UI Rendering Environment Officially Certified.")
    return True

if __name__ == "__main__":
    if verify_ui_integrity():
        sys.exit(0)
    else:
        sys.exit(1)
