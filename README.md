

RUN command for production deployment:

```bash
helm upgrade --install -n cate-webui cate-webui .
```

Run command for stage deployment. Configurations in values.yaml will be overridden by values.stage.yaml. 

```bash
helm upgrade --values Chart.stage.yaml -f values.yaml -f values.stage.yaml --install cate-webui-stage -n cate-webui-stage .
```

## Software Versions used in 0.1.12

| Software          | Version |
|-------------------|---------|
| cate              | 2.1.0   |
| cate-webui        | 2.1.0   |
| miniconda         | 4.8.2   |
| jupyter           | 0.9.6   |
| jupyterhub chart  | 0.8.2   |
