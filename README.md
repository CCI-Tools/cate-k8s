

RUN command for production deployment:

```bash
helm upgrade --install -n cate-webui cate-webui .
```

Run command for stage deployment. Configurations in values.yaml will be overridden by values.stage.yaml. 

```bash
kubectl create secret generic oidc --from-file=client_secrets.json
helm upgrade --values Chart.stage.yaml -f values.yaml -f values.stage.yaml --install cate-webui-stage -n cate-webui-stage .
```

## Software Versions used in 0.2.2

| Software          | Version |
|-------------------|---------|
| cate              | 2.1.*   |
| cate-webui        | 2.1.*   |
| miniconda         | 4.8.2   |

