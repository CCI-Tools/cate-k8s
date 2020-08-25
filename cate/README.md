

RUN command for production deployment:

```bash
helm upgrade --install -n cate-webui cate-webui .
```

RUn command for stage deployment. Configurations in values.yaml will be overridden by values.stage.yaml. 

```bash
helm upgrade --values Chart.stage.yaml -f values.yaml -f values.stage.yaml --install cate-webui-stage -n cate-webui-stage .
```