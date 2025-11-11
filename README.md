
# Welcome to your CloudGo AI Project: GCP Node.js API with Cloud Run and Cloud SQL

## Project Info

**URL**: https://cloudgoai.app/Home#Chat/hJ598mIkTR5z6S9fImaE

This repository contains a **Terraform project generated with CloudGo AI**.

It is scaffolded with:
- **Deployment scripts** for installing required tools and deploying infrastructure.
- **Validation scripts** (linting, security checks) to ensure correctness.


For more details about the Terraform code itself, see the [terraform/README.md](./terraform/README.md).

---

## Quickstart

You can use this project locally or though github actions.

### Local

```sh
# 1. Clone this repository
git clone <your-repo-url>
cd GCP Node.js API with Cloud Run and Cloud SQL

# 2. Install dependencies
./scripts/install.sh

# 3. Validate the configuration
./scripts/check.sh

# 4. Deploy the infrastructure
./scripts/deploy.sh
```

Read the [github workflow doc](docs/cicd-setup-gcp.md) for more details on how to use the github actions instead.

---

## Requirements

- Terraform (installed automatically via scripts/install.sh, but you can install manually if preferred).
- Cloud provider CLI (AWS CLI, gcloud CLI, or Azure CLI depending on the selected provider).
- GitHub Actions (optional) for CI/CD automation.
- Infracost if you want to re-run or adjust cost estimation.

---

## How can I edit this code?

You can work with this project in multiple ways:

**Use CloudGo AI**  
Return to your [CloudGo AI Project](https://cloudgoai.app/Home#Chat/hJ598mIkTR5z6S9fImaE) and keep prompting.  
Any changes made in CloudGo AI can be committed with the github button to this repo.

**Use your preferred IDE**  
Clone this repo locally and push changes. All changes will remain compatible with CloudGo AI.  

**Edit directly in GitHub**  
Navigate to any file in GitHub, click the pencil icon, make edits, and commit.

**Use GitHub Codespaces**  
Click the "Code" button in your repository, choose "Codespaces", and launch a new development environment directly in your browser.

---

## Architecture Diagram
graph LR
  subgraph GCP_Prototype_Infrastructure
    CloudRun("Cloud Run (Node.js API)")
    HTTPS("HTTPS Endpoint (Cloud Run Domain Mapping)")
    CloudSQL("Cloud SQL PostgreSQL (1 vCPU, 4GB RAM)")
    VPC["Default VPC & Firewall Rules"]
    Terraform("Terraform Remote State Management")
    IAM("IAM Roles & Permissions")
  end
  Terraform --> CloudRun
  Terraform --> CloudSQL
  CloudRun --> HTTPS
  CloudRun --> CloudSQL
  CloudRun --> IAM
  CloudSQL --> VPC

---

## Generation Prompt
The following prompt was used to generate this project:

Our CS capstone team is building a small Flask or Node.js API on Google Cloud. We want a single HTTPS URL for the API and a managed PostgreSQL database. Use Google Cloud services and Terraform to set up the API, the database, and basic networking.

---

## References

- [Deployment instructions](./deploy.md)  
- [Provider-specific deployment instructions](./docs/deploy_gcp.md)  
- [Cost estimate (Infracost)](./docs/infracost.json)  
- [Terraform project README](./terraform/README.md)  

---

## Terraform Documentation Found
| Metric                               | Value                   |
|--------------------------------------|-------------------------|
| Total Nodes Scanned                 | 6,149         |
| Relevant Files Analyzed             | 141         |
| Context Files Selected              | 7           |

## Documentation Links
- [https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_v2_service](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_v2_service)
- [https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account)
- [https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_user)
- [https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance)
- [https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service_iam)
- [https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall)
- [https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_domain_mapping](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_domain_mapping)

