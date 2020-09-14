

RUN command for production deployment:

```bash
helm upgrade --install -n cate-webui cate-webui .
```

Run command for stage deployment. Configurations in values.yaml will be overridden by values.stage.yaml. 

```bash
kubectl create secret generic oidc --from-file=client_secrets.json
helm upgrade --values Chart.stage.yaml -f values.yaml -f values.stage.yaml --install cate-webui-stage -n cate-webui-stage .
```

## Software Versions used in 0.1.14

| Software          | Version |
|-------------------|---------|
| cate              | 2.1.*   |
| cate-webui        | 2.1.*   |
| miniconda         | 4.8.2   |
| jupyter           | 0.9.6   |
| jupyterhub chart  | 0.8.2   |


## description

- catehub has been configures as a Kubernetes cluster setup on Jasmin
- catehub provides 10GB of persistent storage to users
- each user get also allocated 4 CPUs and 16GB of RAM
- A maximum number of 50 concurrent users is allowed due to resource limits
- The server reports a 410 (gone) http error once the limit has been reached
- catehub does not autoscale pods. However, pods are semi-scaled as each user obtains his/her own pod
- pod resources are throttled by setting the maximum resource CPU and RAM limits for a pod

- When a user logs a keycloak service instance on Jasmin authenticates the user. 
- Once authenticated the cate webui receives an authorization toen which is used to authorize the user at the backend 
  cate webapi
- If the user is authorizes, a pod for teh user is spawned. The webapi will return its URL to the
- The webui uses the URL to access the cate webapi

- Once the user loggs out the authorization token will be rendered invalid and hence no further operation is possible
