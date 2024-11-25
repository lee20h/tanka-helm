{
  indexGateway: {
    replicas: 1,
    joinMemberlist: true,
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
    resources: {},
    extraContainers: [],
    initContainers: [],
    terminationGracePeriodSeconds: 300,

    affinity: {
      podAntiAffinity: {
        requiredDuringSchedulingIgnoredDuringExecution: [{
          labelSelector: {
            matchLabels: {
              'app.kubernetes.io/component': 'index-gateway',
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

    persistence: {
      enabled: false,
      inMemory: false,
      size: '10Gi',
      storageClass: null,
      annotations: {},
      enableStatefulSetAutoDeletePVC: false,
      whenDeleted: 'Retain',
      whenScaled: 'Retain',
    },

    appProtocol: {
      grpc: '',
    },

    updateStrategy: {
      type: 'RollingUpdate',
    },
  },
}