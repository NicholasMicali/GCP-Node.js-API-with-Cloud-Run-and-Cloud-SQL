
# Local Deploy on GCP

## One-time setup
1. **Install tools**
   ```bash
   ./scripts/install.sh gcp
   source .cloudgo/env.sh
   ```

2. **Set your Terraform directory**
   - Edit `.cloudgo/env.sh` and set:
     ```bash
     export TF_DIR="terraform"   # TODO: set to the folder containing your *.tf
     ```

3. **Authenticate with Google Cloud**
   ```bash
   gcloud auth login
   gcloud config set project YOUR_PROJECT_ID
   ```

4. **Verify**
   ```bash
   gcloud auth list
   terraform version
   ```

## Each deploy
- **Dry run** (fmt → init → validate → plan):
  ```bash
  ./scripts/check.sh gcp
  ```

- **Apply**:
  ```bash
  ./scripts/deploy.sh gcp         # prompts for approval
  ./scripts/deploy.sh gcp -y      # auto-approve
  ```

## State (local by default)
- Your state file lives at: `${TF_DIR}/terraform.tfstate`.
- For team workflows, migrate to GCS backend.

### (Optional) Migrate to remote state (GCS)
Add to a root `.tf` file (example; replace values):
```hcl
terraform {
  backend "gcs" {
    bucket = "YOUR_TFSTATE_BUCKET"
    prefix = "envs/prod"
  }
}
```
Then run:
```bash
terraform -chdir="$TF_DIR" init -migrate-state
```

