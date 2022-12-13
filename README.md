## Relayer Client Configuration

This project is a docker configuration of [Confio TSRelayer](https://github.com/confio/ts-relayer) and [Grafana](https://grafana.com/) & [Prometheus](https://prometheus.io/docs/introduction/overview/) monitoring tools.

### Usage

Is necessary to create a app.yaml inside the config folder.

Ex:

```yaml
src: local_juno # should be a supported network in config/registry.yaml file.
dest: local_wasm
mnemonic: exact start title december impulse random similar eager smart absurd unaware enlist
srcConnection: connection-1 # should be a connection already created.
destConnection: connection-1
```

After create the file, everything should be ready to run the relayer.

```sh
make start
```

In case you want to stop the relayer you can execute

```sh
make stop
```

### Monitoring

The relayer collects various metrics that a Prometheus instance can consume.

The `GET /metrics` endpoint will be exposed by default on port `8080`, which you can override with `--metrics-port` flag, `RELAYER_METRICS_PORT` env variable, or `metricsPort` entry in `app.yaml`.

#### Setting up Grafana

1. Navigate to [http://localhost:3000](http://localhost:3000) and log in (`admin`/`admin`)
2. [Create a Prometheus data source](https://prometheus.io/docs/visualization/grafana/#creating-a-prometheus-data-source)

   > **NOTE:** Use `http://prometheus:9090`

3. Create a new graph and query data
   > **Grafana Guides:**
   - https://grafana.com/docs/grafana/latest/getting-started/getting-started/#step-3-create-a-dashboard
   - https://prometheus.io/docs/visualization/grafana/#creating-a-prometheus-graph
