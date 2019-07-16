
### Helm Convert config
# This is required for the make target 'base'.
# It uses a tool called helm-convert to get the specified helm chart and convert it in to a kustomization
CHART_REPO?=synax
CHART_NAME?=che
CHART_VERSION?=0.3.0
CHART_BASE_PATH?=./helm/convert-out/
CHART_BASE_VALUES?=./helm/values.yaml
HELM_CONVERT_IMAGE?=synaxio/helm-convert:latest

### Kubernetes Configuration
# This is the config which will be used by the 'apply' and 'delete' make targets
KUBE_CLUSTER_CONFIG?=$(shell echo ~/.kube/config)
KUBE_CONTEXT_NAME?=cnative.dev
KUBE_CON_FLAGS?=--kubeconfig ${KUBE_CLUSTER_CONFIG} --context ${KUBE_CONTEXT_NAME}
### Environment config
# This specifies the overlay to be used
ENV?=dev