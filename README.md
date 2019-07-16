# Eclipse Che for Kubernetes

## Prerequisites

### Secrets
Secrets are not part of the kustomization. All secrets have 
to be created manually within the target namespace before the config is applied.

Create the following secrets:

* Eclipse che credentials for infrastructure components: [che.yaml](./templates/secrets/che.yaml)


* Registry pull secrets: [pull-secret.yaml](./templates/secrets/pull-secret.yaml)