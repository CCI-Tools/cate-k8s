# Installation access to Jasmin Cloud

## Configuration of the CateHub K8s on Jasmin

This configuration process requires:

- An existing Kubernetes cluster with an nginx ingress service provided by Jasmin
- An installation of the kubectl client
- Helm client installed

## Installing the requirements

1. First set the following environment variables

```bash
export KUBERNETES_EXTERNAL_IP=192.171.139.57.nip.io
export ID_GATEWAY_DOMAIN=cate-auth.brockmann-consult.de
export CLIENT_ID=cate-k8s
export CLIENT_SECRET=361f7ef0-f7ab-4223-beef-0d1fac86aa53
```

2. Run kubectl configuration

```bash
# Configure the cluster information
kubectl config set-cluster kubernetes \
    --server https://${KUBERNETES_EXTERNAL_IP}:6443 \
    --insecure-skip-tls-verify=true

# Configure the OpenID Connect authentication
kubectl config set-credentials oidc \
    --auth-provider=oidc \
    --auth-provider-arg=idp-issuer-url=https://${ID_GATEWAY_DOMAIN}/auth/realms/master \
    --auth-provider-arg=client-id=${CLIENT_ID} \
    --auth-provider-arg=client-secret=${CLIENT_SECRET}
``` 

3. Setting the kubernetes context

```bash
kubectl config set-context oidc@kubernetes --cluster kubernetes --user oidc
```

4. Finally, login

```bash
# Login using the browser
kubectl oidc-login
# Login without access to a browser
kubectl oidc-login --username [jasmin user name] 
``` 

## Installing a Production Storage Layer on Jasmin 

RUN command for production deployment when using this repo:

```bash
# Create the namespace if it does not yet exist
kuberctl create namespace cate
helm upgrade --install -n cate cate-storage .
```

### Create Storage Layer for the Stage Environment 

RUN command for a stage deployment when using this repo:

```bash
# Create the namespace if it does not yet exist
kuberctl create namespace cate-stage
helm upgrade --install -n cate-stage cate-storage-stage .
```


## Software Versions used in this Version

| Software          | Version |
|-------------------|---------|
| cate              | 2.2.*   |
| nfsvers           | 4.1     |
| goofys            | 0.24.0  |



