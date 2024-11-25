{
  compactor: {
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

    affinity: {
      podAntiAffinity: {
        requiredDuringSchedulingIgnoredDuringExecution: [{
          labelSelector: {
            matchLabels: {
              'app.kubernetes.io/component': 'compactor',
            },
          },
          topologyKey: 'kubernetes.io/hostname',
        }],
      },
    },

    serviceLabels: {},
    serviceAnnotations: {},
    extraArgs: [],
    extraEnv: [],
    extraEnvFrom: [],
    extraVolumeMounts: [],
    extraVolumes: [],
    readinessProbe: {},
    livenessProbe: {},
    resources: {},
    extraContainers: [],
    initContainers: [],
    terminationGracePeriodSeconds: 30,
    nodeSelector: {},
    tolerations: [],

    appProtocol: {
      grpc: '',
    },

    persistence: {
      enabled: false,
      size: '10Gi',
      storageClass: null,
      annotations: {},
      claims: [{
        name: 'data',
        size: '10Gi',
        storageClass: null,
      }],
      enableStatefulSetAutoDeletePVC: false,
      whenDeleted: 'Retain',
      whenScaled: 'Retain',
    },

    serviceAccount: {
      create: false,
      name: null,
      imagePullSecrets: [],
      annotations: {},
      automountServiceAccountToken: true,
    },
  },
}