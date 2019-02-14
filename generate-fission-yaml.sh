#!/bin/sh

mkdir -p generated/fission
helm template helm-templates/fission-all --name fission --namespace fission \
  --set analytics=false \
  --set prometheusDeploy=false \
  --set enableIstio=true \
  > generated/fission/fission-all.yaml

mkdir -p fission
kustomize build kustomize/fission/ --output fission/fission-all.yaml