{
  ruler: {
    enabled: true,
    replicas: 1,
    hostAliases: [],

    image: {
      registry: null,
      repository: null,
      tag: null,
    },

    command: null,
    priorityClassName: null,
    podLabels: {},
    podAnnotations: {},
    serviceLabels: {},
    serviceAnnotations: {},
    extraArgs: [],
    extraEnv: [],
    extraEnvFrom: [],
    extraVolumeMounts: [],
    extraVolumes: [],
    resources: {},
    extraContainers: [],
    initContainers: [],
    terminationGracePeriodSeconds: 300,

    affinity: {
      podAntiAffinity: {
        requiredDuringSchedulingIgnoredDuringExecution: [{
          labelSelector: {
            matchLabels: {
              'app.kubernetes.io/component': 'ruler',
            },
          },
          topologyKey: 'kubernetes.io/hostname',
        }],
      },
    },

    maxUnavailable: null,
    nodeSelector: {},
    topologySpreadConstraints: [],
    tolerations: [],
    dnsConfig: {},

    persistence: {
      enabled: false,
      size: '10Gi',
      storageClass: null,
      annotations: {},
    },

    appProtocol: {
      grpc: '',
    },

    // 규칙 파일을 위한 디렉터리 설정
    directories: {
      /* 예시:
      tenant_foo: {
        'rules1.txt': |||
          groups:
            - name: should_fire
              rules:
                - alert: HighPercentageError
                  expr: |
                    sum(rate({app="foo", env="production"} |= "error" [5m])) by (job)
                      /
                    sum(rate({app="foo", env="production"}[5m])) by (job)
                      > 0.05
                  for: 10m
                  labels:
                    severity: warning
                  annotations:
                    summary: High error rate
        |||,
      }
      */
    },
  },
}