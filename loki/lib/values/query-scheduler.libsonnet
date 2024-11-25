{
  queryScheduler: {
    replicas: 1,
    hostAliases: [],

    image: {
      registry: null,
      repository: null,
      tag: null,
    },

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
    resources: {},#
    extraContainers: [],
    terminationGracePeriodSeconds: 30,

    affinity: {
      podAntiAffinity: {
        requiredDuringSchedulingIgnoredDuringExecution: [{
          labelSelector: {
            matchLabels: {
              'app.kubernetes.io/component': 'query-scheduler',
            },
          },
          topologyKey: 'kubernetes.io/hostname',
        }],
      },
    },

    maxUnavailable: 1,
    nodeSelector: {},
    topologySpreadConstraints: [],
    tolerations: [],

    appProtocol: {
      grpc: '',
    },
  },
}