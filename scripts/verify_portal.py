#!/usr/bin/env python3
import requests
import sys
import argparse
from concurrent.futures import ThreadPoolExecutor

# [WITNESS] Sovereign Portal Verification ⚡
# Purpose: High-speed parallel functional audit of the public gateway.

PROD_URL = "https://civicpulse.thewongway.co"
LOCAL_URL = "http://localhost:3000"

PAGES = {
    "Home": "/",
    "Councilor Performance": "/council_report/",
    "Data Profiling": "/profiling/",
    "Architecture": "/docs/architecture/",
    "Master Plan": "/docs/master_plan/",
    "Manifesto": "/docs/manifesto/",
}

# Genetic Markers certified via direct DOM audit (vREQ-004)
MARKERS = {
    "Home": "The Sovereign Gateway", 
    "Councilor Performance": "Councilor Performance",
    "Data Profiling": "Data Profiling",
    "Architecture": "ZIST Stack",
    "Master Plan": "Project Roadmap",
    "Manifesto": "Sovereign Manifesto",
}

def check_page(name, path, base_url):
    # Use a cache-busting param for the initial check to see if the server IS updated
    # but the test itself should hit the CLEAN url to verify what the user sees.
    url = f"{base_url}{path}"
    try:
        response = requests.get(url, timeout=10)
        if response.status_code != 200:
            return name, False, f"Status {response.status_code}"
        
        marker = MARKERS.get(name)
        if marker and marker.lower() not in response.text.lower():
            return name, False, f"Marker '{marker}' missing (Site may be STALE)"
        
        return name, True, "Certified"
    except Exception as e:
        return name, False, str(e)

def main():
    parser = argparse.ArgumentParser(description="Sovereign Pulse Check")
    parser.add_argument("--local", action="store_true", help="Test local dev server")
    parser.add_argument("--version-check", help="Check for specific version tag (e.g. REQ-004)")
    args = parser.parse_args()

    base_url = LOCAL_URL if args.local else PROD_URL
    print(f"🏮 Starting Sovereign Pulse Check on {base_url}...")

    results = []
    with ThreadPoolExecutor(max_workers=6) as executor:
        futures = [executor.submit(check_page, name, path, base_url) for name, path in PAGES.items()]
        for future in futures:
            name, success, message = future.result()
            icon = "✅" if success else "❌"
            print(f"{icon}  {name.ljust(22)}: {message}")
            results.append(success)
    
    # Optional strict version check on homepage
    if args.version_check:
        try:
            home_text = requests.get(f"{base_url}/").text
            if args.version_check.lower() in home_text.lower():
                print(f"✅ Version Badge '{args.version_check}' detected.")
            else:
                print(f"❌ Version Badge '{args.version_check}' MISSING.")
                results.append(False)
        except:
            results.append(False)

    print("\n--- Summary ---")
    if all(results):
        print("🟢 PULSE: STRONG. All genetic layers certified.")
        sys.exit(0)
    else:
        print("🔴 PULSE: WEAK. Quality gate failed.")
        sys.exit(1)

if __name__ == "__main__":
    main()
