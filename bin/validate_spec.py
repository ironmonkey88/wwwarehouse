#!/usr/bin/env python3
"""
WWWarehouse: Spec Validator (CP-004)
Ensures that all requirements follow the hard technical standard for SPEC phase.
"""

import sys
import os
import re

MANDATORY_HEADERS = [
    r"## 🎯 Description",
    r"## ✅ Acceptance Criteria",
    r"## 🛡️ Verification Gate",
    r"## ✍️ Sign-off"
]

SIGNATURE_PATTERN = r"Signed-by: (.*)"

def validate_requirement(file_path):
    if not os.path.exists(file_path):
        print(f"❌ Error: Requirement file not found: {file_path}")
        return False

    with open(file_path, 'r') as f:
        content = f.read()

    errors = []
    
    # Check Headers
    for header in MANDATORY_HEADERS:
        if not re.search(header, content):
            errors.append(f"Missing mandatory section: {header}")

    # Check Signature
    match = re.search(SIGNATURE_PATTERN, content)
    if not match:
        errors.append("Missing mandatory signature: 'Signed-by: [Name]'")
    else:
        name = match.group(1).strip()
        if name == "[Name]" or not name:
            errors.append(f"Invalid signature name: '{name}'")
        else:
            print(f"✍️  Valid Signature found: {name}")

    if errors:
        print(f"❌ SPEC VALIDATION FAILED for {file_path}:")
        for err in errors:
            print(f"  - {err}")
        return False

    print(f"✅ SPEC VALIDATED: {file_path}")
    return True

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: validate_spec.py [file_path]")
        sys.exit(1)
    
    success = validate_requirement(sys.argv[1])
    sys.exit(0 if success else 1)
