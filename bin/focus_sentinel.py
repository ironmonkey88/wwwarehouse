#!/usr/bin/env python3
"""
bin/focus_sentinel.py: The Focus Sentinel 🛡️
💊 Anti-ADHD medication for the Wong Way Data Factory context integrity.
"""

import os
import sys
import glob

# Configuration
MAX_FILE_SIZE_MB = 1.0
TOXIC_DIRECTORIES = ['.venv', 'target', '__pycache__', '.beads', '.git', '.terraform', '.ignored', SHOWROOM_DIR]
SHOWROOM_DIR = "docs/publishing_docs"

class FocusSentinel:
    def __init__(self):
        self.critical_events = 0
        self.warnings = 0

    def log_critical(self, message):
        print(f"❌ CRITICAL: {message}")
        self.critical_events += 1

    def log_warning(self, message):
        print(f"⚠️ WARNING: {message}")
        self.warnings += 1

    def audit_isolation(self):
        """Rule 2.4: Ensure no factory logic depends on the Showroom."""
        print("🔍 Auditing Structural Isolation...")
        for root, dirs, files in os.walk('.'):
            if SHOWROOM_DIR in root or '.git' in root:
                continue
            for file in files:
                path = os.path.join(root, file)
                if file in ["focus_sentinel.py", "publish_docs.sh"] or path.endswith('.md'):
                    continue
                if file.endswith(('.py', '.sh', '.sql')):
                    with open(path, 'r', errors='ignore') as f:
                        content = f.read()
                        if SHOWROOM_DIR in content:
                            self.log_critical(f"Context Leak: '{path}' references the Showroom folder.")

    def audit_toxic_artifacts(self):
        """Rule 2.5: Detect large or misplaced files."""
        print("🔍 Auditing for Toxic Artifacts...")
        for root, dirs, files in os.walk('.'):
            if any(toxic in root for toxic in TOXIC_DIRECTORIES):
                continue
            for file in files:
                path = os.path.join(root, file)
                if os.path.islink(path):
                    continue
                size_mb = os.path.getsize(path) / (1024 * 1024)
                if size_mb > MAX_FILE_SIZE_MB:
                    self.log_critical(f"Toxic Artifact: '{path}' is {size_mb:.2f}MB. Move to a ignored directory.")

    def audit_hygiene(self):
        """Scan for untracked junk."""
        print("🔍 Auditing Workspace Hygiene...")
        junk_patterns = ['*.DS_Store', '*.tmp', '*.log', 'temp_*', 'draft_*']
        for pattern in junk_patterns:
            for match in glob.glob(f"**/{pattern}", recursive=True):
                self.log_warning(f"Hygiene Breach: Junk file found at '{match}'.")

    def audit_linguistic_purity(self):
        """Rule 5: Detect non-Latin character bleed (The Chinese Problem)."""
        print("🔍 Auditing Linguistic Purity...")
        # Target hex escaped characters for ''
        targets = ['\u8fdb', '\u5c55']
        
        for root, dirs, files in os.walk('.'):
            if any(toxic in root for toxic in TOXIC_DIRECTORIES) or '.git' in root:
                continue
            for file in files:
                if file.endswith(('.py', '.sh', '.sql', '.yml', '.yaml', '.md')):
                    path = os.path.join(root, file)
                    try:
                        with open(path, 'r', encoding='utf-8', errors='ignore') as f:
                            for i, line in enumerate(f, 1):
                                if any(t in line for t in targets):
                                    self.log_critical(f"Linguistic Pollution: '{path}' (Line {i}) contains hallucination characters.")
                    except:
                        pass

    def run(self):
        print("--- 🛡️ Focus Sentinel Audit Starting ---")
        self.audit_isolation()
        self.audit_toxic_artifacts()
        self.audit_hygiene()
        self.audit_linguistic_purity()
        print("\n--- Audit Summary ---")
        print(f"Critical Events: {self.critical_events}")
        print(f"Warnings: {self.warnings}")
        
        if self.critical_events > 0:
            print("\n SYSTEM UNSTABLE: Cleanup required.")
            sys.exit(1)
        else:
            print("\n✅ FACTORY HEALTHY: Context is isolated and pure.")
            sys.exit(0)

if __name__ == "__main__":
    FocusSentinel().run()
