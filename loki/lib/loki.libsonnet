local tanka = import 'github.com/grafana/jsonnet-libs/tanka-util/main.libsonnet';
local helm = tanka.helm.new(std.thisFile);
local values = import 'values.jsonnet';
function(params)
  // 기본값 설정
  local defaults = {
    namespace: 'default-namespace',
    values: {
      loki+: {
        storage+: {
          bucketNames: {
            chunks: "default_chunks",
            ruler: "default_ruler",
          },
        },
        schemaConfig+: {
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
        }
      },
    },
  };

  // 입력 params와 기본값 병합
  local config = std.mergePatch(defaults, params);

  // Helm 템플릿 생성
  helm.template('loki', '../charts/loki', {
    namespace: config.namespace,
    values: std.mergePatch(values.loki, config.values),
  })
