{
  loki: {
    memberlistConfig: {},
    extraMemberlistConfig: {},
    tenants: [],
    server: {
      http_listen_port: 3100,
      grpc_listen_port: 9095,
      http_server_read_timeout: '600s',
      http_server_write_timeout: '600s',
    },
    limits_config: {
      reject_old_samples: true,
      reject_old_samples_max_age: '168h',
      max_cache_freshness_per_query: '10m',
      split_queries_by_interval: '15m',
      query_timeout: '300s',
      volume_enabled: true,
    },
    runtimeConfig: {},
    commonConfig: {
      path_prefix: '/var/loki',
      replication_factor: 3,
      compactor_address: '{{ include "loki.compactorAddress" . }}',
    },
    storage: {
      type: 's3',
      s3: {
        s3: null,
        endpoint: null,
        region: null,
        secretAccessKey: null,
        accessKeyId: null,
        signatureVersion: null,
        s3ForcePathStyle: false,
        insecure: false,
        http_config: {},
        backoff_config: {},
        disable_dualstack: false,
      },
      filesystem: {
        chunks_directory: '/var/loki/chunks',
        rules_directory: '/var/loki/rules',
        admin_api_directory: '/var/loki/admin',
      },
    },
    memcached: {
      chunk_cache: {
        enabled: false,
        host: '',
        service: 'memcached-client',
        batch_size: 256,
        parallelism: 10,
      },
      results_cache: {
        enabled: false,
        host: '',
        service: 'memcached-client',
        timeout: '500ms',
        default_validity: '12h',
      },
    },
    schemaConfig: {},
    useTestSchema: false,
    testSchemaConfig: {
      configs: [
        {
          from: '2024-04-01',
          store: 'tsdb',
          object_store: '{{ include "loki.testSchemaObjectStore" . }}',
          schema: 'v13',
          index: {
            prefix: 'index_',
            period: '24h',
          },
        },
      ],
    },
    rulerConfig: {},
    structuredConfig: {},
    query_scheduler: {},
    storage_config: {
      boltdb_shipper: {
        index_gateway_client: {
          server_address: '{{ include "loki.indexGatewayAddress" . }}',
        },
      },
      tsdb_shipper: {
        index_gateway_client: {
          server_address: '{{ include "loki.indexGatewayAddress" . }}',
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
    compactor: {},
    pattern_ingester: {
      enabled: false,
    },
    analytics: {},
    query_range: {},
    querier: {},
    ingester: {},
    index_gateway: {
      mode: 'simple',
    },
    frontend: {
      scheduler_address: '{{ include "loki.querySchedulerAddress" . }}',
      tail_proxy_url: '{{ include "loki.querierAddress" . }}',
    },
    frontend_worker: {
      scheduler_address: '{{ include "loki.querySchedulerAddress" . }}',
    },
    distributor: {},
    tracing: {
      enabled: false,
    },
    bloom_build: {
      enabled: false,
      builder: {
        planner_address: '{{ include "loki.bloomPlannerAddress" . }}',
      },
    },
    bloom_gateway: {
      enabled: false,
      client: {
        addresses: '{{ include "loki.bloomGatewayAddresses" . }}',
      },
    },
  },
}