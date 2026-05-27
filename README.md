# iac_tests

A collection of Infrastructure-as-Code (IaC) fixtures for exercising IaC
security scanners. Each directory holds intentionally **insecure** and
**secure** examples so a scanner's findings can be diffed against known
expectations.

> ⚠️ These files contain deliberate misconfigurations for testing purposes.
> **Do not deploy them.**

## Layout

| Directory | Format | What it covers |
|-----------|--------|----------------|
| `terraform/`       | Terraform HCL        | AWS S3, EC2, security groups |
| `cloudformation/`  | CloudFormation YAML  | AWS S3 bucket |
| `kubernetes/`      | Kubernetes manifests | Privileged Deployment |
| `kustomize/`       | Kustomize            | base + prod overlay |
| `bicep/`           | Azure Bicep          | Storage account |
| `helm/`            | Helm chart           | Web Deployment + Service |
| `ansible/`         | Ansible playbook     | Host hardening tasks |
| `docker/`          | Dockerfile           | Image build hygiene |

## Convention

Files suffixed `_insecure` contain misconfigurations a scanner should flag.
Files suffixed `_secure` are the hardened counterpart and should pass clean.
