local loki = import 'loki.libsonnet';
{
  loki: loki.new({
    namespace: "loki",
    values+: {
      deploymentMode: 'Distributed',
      loki+: {
        image+: {
          tag: '3.3.0',
        },
        analytics: {
          reporting_enabled: false,
        },
        chunk_store_config: {
          chunk_cache_config: {
            memcached: {
              batch_size: 4,
              parallelism: 5,
            },
            memcached_client: {
              consistent_hash: true,
              host: 'memcached.loki.svc.cluster.local',
              service: 'memcached-client',
            },
          },
          max_look_back_period: '24h',
        },
        common: {
          compactor_address: 'http://loki-compactor:3100',
          path_prefix: '/var/loki',
          replication_factor: 3,
          storage: {
            s3: {
              bucketnames: null,
              insecure: false,
              s3forcepathstyle: false,
            },
          },
        },
        server: {
          graceful_shutdown_timeout: '5s',
          grpc_server_max_concurrent_streams: 1000,
          grpc_server_max_recv_msg_size: 1.048576e+08,
          grpc_server_max_send_msg_size: 1.048576e+08,
          grpc_server_min_time_between_pings: '10s',
          grpc_server_ping_without_stream_allowed: true,
          http_listen_port: 3100,
          http_server_idle_timeout: '120s',
          http_server_write_timeout: '1m',
          log_level: 'info',
        },
        rulerConfig: {
          alertmanager_url: "",
          enable_alertmanager_v2: true,
          enable_api: true,
          enable_sharding: true,
          clients: {
            thanos: {
                name: 'thanos',
                url: 'http://thanos/api/v1/receive',
            }
          },
          ring: {
            kvstore: {
          },
          rule_path: '/tmp/rules',
          storage: {
            s3: {
              s3: 's3://ap-northeast-2/loki',
              s3forcepathstyle: false,
            },
            type: 's3',
          },
          wal: {
            dir: '/data/ruler-wal'
          }
        },
        storage_config: {
          aws: {
            s3: 's3://ap-northeast-2/loki',
            s3forcepathstyle: 'false'
          },
          boltdb_shipper+: {
            active_index_directory: '/data/index',
            cache_location: '/data/boltdb-cache',
          },
          tsdb_shipper+: {
            index_gateway_client+: {
            },
          },
        },
        schemaConfig: {
          configs: [
            {
              from: '2024-11-25',
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
        pattern_ingester+: {
          enabled: false,
        },
        ingester: {
          chunk_block_size: '262144',
          chunk_idle_period: '15m',
          lifecycler: {
              heartbeat_period: '5s',
              join_after: '30s',
              num_tokens: '512',
              ring: {
                  heartbeat_timeout: '1m',
                  kvstore: {
                      store: 'memberlist',
                  },
                  replication_factor: 1,
              },
          },
          max_transfer_retries: 0,
          wal: {
              dir: '/loki/wal',
              enabled: true,
              replay_memory_ceiling: '7GB',
          },
        },
        ingester_client: {
          grpc_client_config: {
            max_recv_msg_size: 6.7108864e+07,
          },
          remote_timeout: '1s',
        },
        index_gateway: {
          mode: 'simple',
          ring: {
              heartbeat_timeout: '5m',
              kvstore: {
                  store: 'memberlist',
              },
          }
        },
        frontend+: {
          compress_responses: true,
          log_queries_longer_than: '5s',
          max_outstanding_per_tenant: 2048,
          grpc_client_config: {
            max_send_msg_size: 104857600,
            grpc_compression: 'snappy',
          },
        },
        frontend_worker+: {
          grpc_client_config: {
            max_send_msg_size: 104857600,
            grpc_compression: 'snappy',
          },
        },
        querier: {
          max_concurrent: 4,
          query_ingesters_within: '2h',
        },
        query_range: {
          align_queries_with_step: true,
          cache_results: true,
          max_retries: 5,
          parallelise_shardable_queries: false,
          results_cache: {
            cache: {
              memcached_client: {
                consistent_hash: true,
                max_idle_conns: 16,
                service: 'memcached-client',
                timeout: '500ms',
                update_interval: '1m',
              },
            },
            compression: 'snappy',
          },
        },
        distributor: {
          ring: {
            kvstore: {
                watch_rate_limit: 1,
              },
              store: 'memberlist',
            },
          },
        },
        limits_config: {
          enforce_metric_name: false,
          ingestion_burst_size_mb: 20,
          ingestion_rate_mb: 10,
          ingestion_rate_strategy: 'global',
          max_cache_freshness_per_query: '10m',
          max_global_streams_per_user: 10000,
          max_query_length: '12000h',
          max_query_parallelism: 256,
          max_query_series: 800,
          max_streams_per_user: 0,
          reject_old_samples: true,
          reject_old_samples_max_age: '168h',
          split_queries_by_interval: '30m',
        },
        structuredConfig: {},
        query_scheduler: {},
        compactor: {
          working_directory: '/data/compactor',
        },
        bloom_build+: {
          enabled: true,
        },
        bloom_gateway+: {
          enabled: true,
        },
      },

      distributor+: {
        replicas: 1,
      },

      ingester+: {
        replicas: 3,
        zoneAwareReplication: {
          enabled: false,
        },
      },

      compactor+: {
        replicas: 1,
      },

      querier+: {
        replicas: 1,
      },

      queryFrontend+: {
        replicas: 1,
      },

      memcached+: {
        replicas: 2,
      },

      chunksCache: {
        replicas: 1,
      },

      resultsCache: {
        replicas: 1,
      },

      gateway+: {
        replicas: 1,
      },

      indexGateway+:  {
        replicas: 1,
      },

      ruler+: {
        replicas: 1,
      },
      monitoring+: {
        serviceMonitor+: {
          enabled: true,
        },
      },
    }
  })
}
