include config.mk

.PHONY: base
base:
	@echo ":::building base from helm chart"
	@echo "::removing old base"
	docker run -ti -v $(shell pwd)/:/src/ -w /src/ --entrypoint rm ${HELM_CONVERT_IMAGE} -rdf ${CHART_BASE_PATH}
	@echo "::generating new base from chart [${CHART_REPO}/${CHART_NAME}], with version [${CHART_VERSION}]"
	docker run -ti -v $(shell pwd)/:/src/ -w /src/ ${HELM_CONVERT_IMAGE} repo add synax https://charts.synax.io ; helm repo update ; helm convert --values=${CHART_BASE_VALUES} --version=${CHART_VERSION} --destination=${CHART_BASE_PATH} --name=${CHART_NAME} --force ${CHART_REPO}/${CHART_NAME}

.PHONY: apply
apply:
	@echo ":::applying kustomization for environment ${ENV}"
	kubectl apply -k ./${ENV} ${KUBE_CON_FLAGS}

.PHONY: delete
delete:
	@echo ":::deleting kustomization for environment ${ENV}"
	kubectl delete -k ./${ENV} ${KUBE_CON_FLAGS}
