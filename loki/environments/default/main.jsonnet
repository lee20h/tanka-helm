local loki = import 'loki.libsonnet';

local values = {
  namespace: 'loki',
  deploymentMode: 'Distributed',
  loki+: {
    image+: {
      tag: '3.2.0',
    },
    storage+: {
      bucketNames+: {
        chunks: 'loki_chunks',
        ruler: 'loki_ruler',
      },
      s3+: {
        s3: 'sample',
        region: 'ap-northeast2',
        endpoint: 'endpoint',
      },
    },
    memcached+: {
      chunk_cache+: {
        enabled: true,
        host: 'memcached',
        batch_size: '256',
        parallelism: '10',
      },
      results_cache+: {
        enabled: true,
        host: 'memcached',
      },
    },
    schemaConfig: {
      configs: [
        {
          from: '2024-04-01',
          store: 'tsdb',
          object_store: 's3',
          schema: 'v13',
          index: {
            prefix: 'index_',
            period: '24h',
          },
        },
      ],
    },
    rulerConfig: {},
    storage_config+: {
      boltdb_shipper: {
        index_gateway_client: {
          server_address: 'index-gateway',
        },
      },
      tsdb_shipper: {
        index_gateway_client: {
          server_address: 'index-gateway',
        },
      },
      bloom_shipper: {
        working_directory: '/var/loki/data/bloomshipper',
      },
      hedging: {
       at: '250ms',
        max_per_second: 20,
        up_to: 3,
      },
    },
    pattern_ingester+: {
      enabled: false,
    },
    query_range: {},
    querier: {},
    ingester: {},
    index_gateway: {
      mode: 'simple',
    },
    frontend+: {},
    frontend_worker+: {},
    distributor: {},
    ruler+: {
      replicas: 2,
    },
    bloom_build+: {
      enabled: true,
    },
    bloom_gateway+: {
      enabled: true,
    },
  },
};

loki(values)
