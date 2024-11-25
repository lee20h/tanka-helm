local tanka = import "github.com/grafana/jsonnet-libs/tanka-util/main.libsonnet";
local helm = tanka.helm.new(std.thisFile);
local loki_cf = import "values/config.libsonnet";
local loki_gw = import "values/gateway.libsonnet";
local loki_compactor = import "values/compactor.libsonnet";
local loki_distributor = import "values/distributor.libsonnet";
local loki_idx_gw = import "values/index-gateway.libsonnet";
local loki_ingester = import "values/ingester.libsonnet";
local loki_querier = import "values/querier.libsonnet";
local loki_qs = import "values/query-scheduler.libsonnet";
local loki_qf = import "values/query-frontend.libsonnet";
local loki_ruler = import "values/ruler.libsonnet";
local loki_bloom = import "values/bloom-workload.libsonnet";
local memcached = import "values/memcached.libsonnet";

{
  new(params={})::
    local defaults = loki_cf + {
      deploymentMode: 'Distributed',
      fullnameOverride: '',
      nameOverride: '',
      loki+: {
        image+: {
          tag: '3.3.0',
        },
        storage+: {
          type: 's3',
          bucketNames: {
            chunk: 'FIXME',
            rules: 'FIXME',
          },
        },
      },
      backend: {
        replicas: 0,
      },
      read: {
        replicas: 0,
      },
      write: {
        replicas: 0,
      },
      singleBinary: {
        replicas: 0,
      },
      ingester+: {
        zoneAwareReplication: {
          enabled: false,
        },
      },
      lokiCanary: {
        enabled: false,
      },
      test: {
        enabled: false,
      },
      monitoring: {
        serviceMonitor: {
          enabled: true,
        },
      },
    } + loki_gw + loki_compactor + loki_distributor + loki_idx_gw + loki_ingester + loki_querier
      + loki_qf + loki_qs + loki_ruler + loki_bloom + memcached;


    helm.template("loki", "../charts/loki", {
      namespace: params.namespace,
      values: defaults + params.values,
    })
}


