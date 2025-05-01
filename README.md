# Terraform AKS and Azure Resources Deployment

This repository contains Terraform configurations for deploying and managing Azure resources, including an Azure Kubernetes Service (AKS) cluster, storage accounts, and key vaults. The project is structured to support multiple environments (e.g., `dev`, `qa`) with reusable modules.

---

## Features

### 1. **Azure Kubernetes Service (AKS)**
- Deploys an AKS cluster with:
  - Azure Policy enabled (`azure_policy_enabled = true`).
  - API server access restricted to specific IP ranges.
  - System-assigned managed identity.
  - Configurable node count and VM size.

### 2. **Storage Account**
- Creates a storage account with:
  - Standard tier and locally redundant storage (LRS).
  - Configurable name, resource group, and location.

### 3. **Key Vault**
- Deploys an Azure Key Vault with:
  - Standard SKU.
  - Configurable name, resource group, and location.

### 4. **Environment-Specific Configurations**
- Separate configurations for `dev` and `qa` environments.
- Uses backend state stored in Azure Blob Storage.

### 5. **CI/CD Integration**
- GitHub Actions workflow (`terraform-deploy.yml`) for automated deployment:
  - Supports `plan` and `apply` stages.
  - Allows enabling/disabling AKS deployment for `dev`.

---

## Prerequisites

1. **Azure CLI**:
   - Install the Azure CLI: [Azure CLI Installation Guide](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
   - Authenticate using:
     ```bash
     az login
     ```

2. **Terraform**:
   - Install Terraform: [Terraform Installation Guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

3. **Azure Service Principal**:
   - Create a service principal for Terraform:
     ```bash
     az ad sp create-for-rbac --name "terraform-sp" --role="Contributor" --scopes="/subscriptions/<subscription-id>"
     ```

---

## Usage

### 1. **Clone the Repository**
```bash
git clone https://github.com/<your-repo>/tf-test-project.git
cd tf-test-project
```

### 2. **Initialize Terraform**
Navigate to the desired environment (e.g., dev) and initialize Terraform:
```bash
terraform init
```

### 3. **Plan the Deployment**
Generate an execution plan:
```bash
terraform plan
```

### 4. **Apply the Deployment**
Apply the changes:
```bash
terraform apply
```

### 5. **Destroy Resources**
To destroy the resources:
```bash
terraform destroy
```

---

## Configuration

### Environment Variables
Set the following environment variables for authentication:
```bash
export ARM_CLIENT_ID=<client-id>
export ARM_CLIENT_SECRET=<client-secret>
export ARM_SUBSCRIPTION_ID=<subscription-id>
export ARM_TENANT_ID=<tenant-id>
```

### Variables
Customize variables in the `variables.tf` files for each environment. Key variables include:
- `aks_cluster_name`: Name of the AKS cluster.
- `aks_node_count`: Number of nodes in the default node pool.
- `aks_node_vm_size`: VM size for the AKS nodes.
- `api_server_authorized_ip_ranges`: List of IP ranges allowed to access the AKS API server.

---

## CI/CD Workflow

The repository includes a GitHub Actions workflow (`terraform-deploy.yml`) for automated deployment:

### Inputs:
- `environment`: Select the environment (`dev`, `qa`).
- `enable_aks`: Enable AKS deployment (only for `dev`).

### Stages:
1. **Terraform Plan**: Generates a plan for the selected environment.
2. **Terraform Apply**: Applies the plan.

---

## Outputs

### AKS Module
- `aks_cluster_id`: The ID of the AKS cluster.
- `kube_config`: The kubeconfig for the AKS cluster (sensitive).

### Storage Account Module
- `storage_account_id`: The ID of the storage account.

### Key Vault Module
- `key_vault_id`: The ID of the Key Vault.

---

## Best Practices

### State Management:
- Store Terraform state in Azure Blob Storage for collaboration and consistency.

### Security:
- Use Azure Key Vault to manage sensitive secrets.
- Restrict AKS API server access using `api_server_authorized_ip_ranges`.

### Logging and Monitoring:
- Enable Azure Monitor for AKS to collect logs and metrics.
- Use Microsoft Defender for Containers to scan container images for vulnerabilities.

---

## License

This project is licensed under the Mozilla Public License Version 2.0.
