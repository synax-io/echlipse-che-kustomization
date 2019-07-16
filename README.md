# Eclipse Che for Kubernetes

## Prerequisites

### Secrets
Secrets are not part of the kustomization. All secrets have 
to be created manually within the target namespace before the config is applied.

Create the following secrets:

* Eclipse che credentials for infrastructure components: [che.yaml](./templates/secrets/che.yaml)


* Registry pull secrets: [pull-secret.yaml](./templates/secrets/pull-secret.yaml)

### Namespace
The `dev-tools` namespace has to be created manually.

`kubectl create namespace dev-tools`

### Kubectl
Kubectl 1.14+ is required because the make targets use the -k flag for kustomize. Alternative is to use the kustomize plugin or standalone binary.

## Make targets
> The config can be changed in the [config.mk](./config.mk) file.

* `make base`: Generates the base using the che helm chart.

* `make apply`: Deploys the specs

* `make delete`: Deletes the specs
