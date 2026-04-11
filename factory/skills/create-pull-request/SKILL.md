---
name: create-pull-request
description: >-
  Create a GitHub pull request safely and autonomously. Use when you are acting 
  as "The Refinery" to merge features. Handles branch checking, PR template formatting,
  and conflict checking using the `gh` CLI.
metadata:
  category: development
  author: The Swarm (Refinery)
---

# Create Pull Request (The Refinery Skill)

This skill dictates how to open a flawless, perfectly annotated pull request without human intervention.

## 1. Prerequisites Check (The Safety Seal)

Before interacting with Git, verify the state of the machine:

### Check Github CLI Auth
Use `run_command` to execute:
```bash
gh auth status
```
If not authenticated, STOP. Tell the Conductor to run `gh auth login`.

### Verify Working Directory
Use `run_command` to execute:
```bash
git status
```
If there are uncommitted changes, ask the Conductor if they should be committed, stashed, or discarded. Do not proceed until the tree is clean.

## 2. Gather Context (The Memory Seal)

Do not guess what the PR is about based on your session history. Read the actual git history:

```bash
git branch --show-current
git log origin/main..HEAD --oneline --no-decorate
git diff origin/main..HEAD --stat
```
*If you are on `main`, STOP. Ask the Conductor to create a feature branch.*

## 3. Generate the PR Body

Ensure you adhere to the project's PR standards. 
Identify the following from the commit log:
1. **The Issue/Bead Number** (e.g., CP-311-04)
2. **The Goal** (Why were these changes made?)
3. **The Evidence** (Proof section / TDD Gate references)

**IMPORTANT: Do not try to pipeline the body text into a `gh pr create --body "..."` command directly. Bash string escaping will cause quoting errors and fail the command.**

Instead, write the generated markdown body into a temporary file:
```bash
# Example logic
cat << 'EOF' > /tmp/pr-body.md
## Related Bead
Resolves [Bead ID]

## Changes Made
- [List exact changes]

## Verification
- Proof Section / TDD Lab status
EOF
```

## 4. Execute the Handover

1. Push the branch if it is not pushed: `git push -u origin HEAD`
2. Create the PR: `gh pr create --title "[Title]" --body-file /tmp/pr-body.md --base main`
3. Delete the temp file: `rm /tmp/pr-body.md`
4. Post the generated PR URL into the chat so the Conductor can perform the final human audit.
