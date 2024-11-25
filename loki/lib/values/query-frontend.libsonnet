{
  queryFrontend: {
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
    terminationGracePeriodSeconds: 30,

    affinity: {
      podAntiAffinity: {
        requiredDuringSchedulingIgnoredDuringExecution: [{
          labelSelector: {
            matchLabels: {
              'app.kubernetes.io/component': 'query-frontend',
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

    appProtocol: {
      grpc: '',
    },
  },
}