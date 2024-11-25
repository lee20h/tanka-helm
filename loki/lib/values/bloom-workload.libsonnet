{
  bloomGateway: {
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
              'app.kubernetes.io/component': 'bloom-gateway',
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

  bloomPlanner: {
    // Similar structure as bloomGateway with component name changed to 'bloom-planner'
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
              'app.kubernetes.io/component': 'bloom-planner',
            },
          },
          topologyKey: 'kubernetes.io/hostname',
        }],
      },
    },
    // ... rest of the fields similar to bloomGateway
  },

  bloomBuilder: {
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
              'app.kubernetes.io/component': 'bloom-builder',
            },
          },
          topologyKey: 'kubernetes.io/hostname',
        }],
      },
    },
    maxUnavailable: null,
    nodeSelector: {},
    tolerations: [],
    appProtocol: {
      grpc: '',
    },
  },
}