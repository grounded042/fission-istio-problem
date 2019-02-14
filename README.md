# fission-istio

## setup

1. start up minikube `$ minikube start --cpus 4 --memory 8192 --extra-config=controller-manager.cluster-signing-cert-file="/var/lib/minikube/certs/ca.crt" --extra-config=controller-manager.cluster-signing-key-file="/var/lib/minikube/certs/ca.key"`
2. Apply Istio CRDs `$ kubectl apply -f istio-1.0.6/install/kubernetes/helm/istio/templates/crds.yaml`
3. Apply non mTLS Istio `$ kubectl apply -f istio-1.0.6/install/kubernetes/istio-demo.yaml`
4. Make sure the Istio services are created `$ kubectl get svc -n istio-system`
5. Make sure all Istio pods are running `$ kubectl get pods -n istio-system`
6. Apply Fission `$ kubectl apply -f fission/fission-all.yaml`
5. Make sure all Fission pods are running `$ kubectl get pods -n fission`

## run a function
1. `$ fission environment create --name go --image fission/go-env --builder fission/go-builder`
2. `$ fission fn create --name helloworld --env go --src fission-test.go --entrypoint Handler`
3. `$ fission pkg info --name <name-from-last-command>`
4. `$ fission fn test --name helloworld`