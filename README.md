# DEPI-Project

DEPI-Project is a Helm-based deployment of the Google Online Boutique microservices demo adapted for learning, testing, and demonstration of Kubernetes + Helm workflows. This repository contains service sources, Dockerfiles, Helm charts, example custom values, and developer helper scripts used to deploy and validate the multi-service demo on a Kubernetes cluster (commonly GKE).

## Highlights

- Deploy 10+ microservices (frontend, cart, checkout, currency, email, payment, product catalog, recommendation, shipping, etc.) via Helm.
- Reproducible Helm charts and per-service Dockerfiles located under `helm/` and `src/` respectively.
- Helper scripts for generating protobufs and example custom values for environments.

> NOTE: This project is derived from Google Online Boutique for demonstration purposes.

## Repository layout

Top-level folders and important files:

- `helm/` — Helm charts and example custom values
  - `charts/depi_project_chart/` — main chart used to install the demo
  - `custom_values_files/` — example `values.yaml` files per service
  - `install.sh` — convenience script to install the chart (review before running)
- `src/` — microservice source folders (one folder per service)
  - `adservice/`, `cartservice/`, `checkoutservice/`, `currencyservice/`, `emailservice/`, `frontend/`, `loadgenerator/`, `paymentservice/`, `productcatalogservice/`, `recommendationservice/`, `shippingservice/`, `shoppingassistantservice/`, etc.
- `LICENSE` — repository license

Each service folder typically contains a `Dockerfile`, `genproto.sh` (if applicable), and the source code.

## Prerequisites

- A Kubernetes cluster (GKE, minikube, KIND, or other) and `kubectl` configured to point at it.
- Helm 3 installed and available in your PATH.
- Docker (or another container builder) to build images if you want to use local images rather than prebuilt images.
- (Optional) Google Cloud SDK if deploying to GKE and using gcloud auth.

## Quick start — one-line (review before running)

The repository includes a helper script. From the repo root:

```bash
# review `helm/install.sh` before running
./helm/install.sh
```

Alternatively install the chart directly with Helm:

```bash
helm install depi-boutique ./helm/charts/depi_project_chart -f helm/custom_values_files/custom_frontend_values.yaml
```

Replace the `-f` value with a different custom values file as needed (see `helm/custom_values_files/`).

## Verify the deployment

Check pods and services after installing:

```bash
kubectl get namespaces
kubectl get pods -n default
kubectl get svc -n default
```

Port-forward the frontend to access the UI locally (example):

```bash
kubectl port-forward svc/frontend 8080:80
# then open http://localhost:8080
```

Or retrieve the external LoadBalancer IP (if using cloud provider):

```bash
kubectl get svc frontend
```

## Generating protobufs

Several services include `.proto` definitions and helper scripts to generate language-specific stubs. From a service folder:

```bash
./genproto.sh
```

Review each service folder for language-specific requirements (Python `requirements.txt`, Go modules, Node `package.json`).

## Local development and testing

- To run an individual service locally, open its folder under `src/<service>` and follow the README in that folder (many services include a README with service-specific run instructions).
- `loadgenerator/` contains a Locust-based load test to validate behavior under load. See `loadgenerator/locustfile.py` and its `requirements.txt`.

## CI/CD and automation

This repo does not currently provide a mandatory CI pipeline. If you add CI (GitHub Actions / Cloud Build / Jenkins), consider automating:

- building and pushing container images
- running Helm lint and chart tests
- running smoke tests after deployment

## Troubleshooting

- If pods are CrashLoopBackOff, inspect logs: `kubectl logs <pod-name>` or `kubectl describe pod <pod-name>`.
- Confirm image pull secrets and registry access if images fail to start.
- Increase verbosity of `helm` commands: `helm install --debug --wait` to get more details.

## Contributing

Contributions, fixes, and improvements are welcome. Please open an issue or a pull request and include a short description of the change and any testing steps.

## Acknowledgements

This project is a learning/demo adaptation based on the Google Online Boutique sample microservices application.

## License

See the `LICENSE` file at the repository root.

---

If you want, I can also:

- add a short
