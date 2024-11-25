{
  ingester: {
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
    terminationGracePeriodSeconds: 300,
    lifecycle: {},

    topologySpreadConstraints: [{
      maxSkew: 1,
      topologyKey: 'kubernetes.io/hostname',
      whenUnsatisfiable: 'ScheduleAnyway',
      labelSelector: {
        matchLabels: {
          'app.kubernetes.io/component': 'ingester',
        },
      },
    }],

    affinity: {
      podAntiAffinity: {
        requiredDuringSchedulingIgnoredDuringExecution: [{
          labelSelector: {
            matchLabels: {
              'app.kubernetes.io/component': 'ingester',
            },
          },
          topologyKey: 'kubernetes.io/hostname',
        }],
      },
    },

    maxUnavailable: 1,
    nodeSelector: {},
    tolerations: [],
    readinessProbe: {},
    livenessProbe: {},

    updateStrategy: {
      type: 'RollingUpdate',
    },

    persistence: {
      enabled: false,
      inMemory: false,
      claims: [{
        name: 'data',
        size: '10Gi',
        storageClass: null,
      }],
      enableStatefulSetAutoDeletePVC: false,
      whenDeleted: 'Retain',
      whenScaled: 'Retain',
    },

    appProtocol: {
      grpc: '',
    },

    zoneAwareReplication: {
      enabled: true,
      maxUnavailablePct: 33,
      zoneA: {
        nodeSelector: null,
        extraAffinity: {},
        annotations: {},
        podAnnotations: {},
      },
      zoneB: {
        nodeSelector: null,
        extraAffinity: {},
        annotations: {},
        podAnnotations: {},
      },
      zoneC: {
        nodeSelector: null,
        extraAffinity: {},
        annotations: {},
        podAnnotations: {},
      },
      migration: {
        enabled: false,
        excludeDefaultZone: false,
        readPath: false,
        writePath: false,
      },
    },
  },
}