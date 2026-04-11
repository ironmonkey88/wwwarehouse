# Skill: Frugality Audit 📉

## Objective
Enforce the "Frugal Stack" principle by vetting all new dependencies and architecture shifts for memory, storage, and maintenance overhead.

## Tactical Instructions

### 1. The Dependency Gate
- Every new Python library must be checked via `pip show [package]` for size. 
- If a package is >10MB, the Architect must justify why a smaller alternative cannot be used.
- Reject "Swiss Army Knife" libraries (e.g., pandas) if a specialized solution (e.g., polars or duckdb) is already present.

### 2. Resource Mapping
- Estimate the token cost of including a new library's documentation in the agent's context. 
- If documentation is >5000 tokens, it must be "Ported" following the **Progressive Disclosure** principle.

### 3. Maintenance Vetting
- Check the GitHub "Last Modified" date of any new dependency. If it is >1 year old, reject it as a "Zombie Asset" unless it is a core binary (e.g., git).

## Validation Trinity
1. **Weight**: Is the new asset significantly smaller than the alternatives?
2. **Maintenance**: Is the asset actively maintained?
3. **Token Efficiency**: Does adding this asset increase the agent's context burden by <5%?
