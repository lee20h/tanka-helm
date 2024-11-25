{
  querier: {
    replicas: 1,
    hostAliases: [],

    autoscaling: {
      enabled: false,
      minReplicas: 1,
      maxReplicas: 3,
      targetCPUUtilizationPercentage: 60,
      targetMemoryUtilizationPercentage: null,
      customMetrics: [],
      behavior: {
        enabled: false,
        scaleDown: {},
        scaleUp: {},
      },
    },

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
    terminationGracePeriodSeconds: 30,

    topologySpreadConstraints: [{
      maxSkew: 1,
      topologyKey: 'kubernetes.io/hostname',
      whenUnsatisfiable: 'ScheduleAnyway',
      labelSelector: {
        matchLabels: {
          'app.kubernetes.io/component': 'querier',
        },
      },
    }],

    affinity: {
      podAntiAffinity: {
        requiredDuringSchedulingIgnoredDuringExecution: [{
          labelSelector: {
            matchLabels: {
              'app.kubernetes.io/component': 'querier',
            },
          },
          topologyKey: 'kubernetes.io/hostname',
        }],
      },
    },

    maxUnavailable: null,
    maxSurge: 0,
    nodeSelector: {},
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
  },
}