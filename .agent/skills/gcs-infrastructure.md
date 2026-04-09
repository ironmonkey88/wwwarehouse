# Skill: GCS Infrastructure Provisioning 🏗

This skill governs the creation and management of Google Cloud Storage resources using Terraform.

## 🎯 Context Activation
Activate this skill when a Bead requires:
- Creating or modifying a GCS bucket.
- Setting IAM roles for Storage.
- Configuring bucket versioning or lifecycle rules.

## 🛠 Operational Methodology
1. **Directory**: Always work in `infra/terraform/`.
2. **Naming**: Buckets must be globally unique. Use the format `warehouse-<project_id>-<suffix>`.
3. **Security**:
    - Always enable `uniform_bucket_level_access`.
    - Always enable `versioning`.
    - Never set `force_destroy = true` for production buckets.
4. **Testing**:
    - `terraform validate`
    - `terraform plan`
5. **Role Binding**: Bind the `factory-runner` service account to `roles/storage.objectAdmin`.

## 🧩 Dependencies
- GCP Account with Active ADC.
- Terraform v1.5.0+.
