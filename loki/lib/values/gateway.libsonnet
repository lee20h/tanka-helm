{
  gateway: {
    enabled: true,
    replicas: 1,
    containerPort: 8080,
    verboseLogging: true,

    autoscaling: {
      enabled: false,
      minReplicas: 1,
      maxReplicas: 3,
      targetCPUUtilizationPercentage: 60,
      targetMemoryUtilizationPercentage: null,
      behavior: {},
    },

    deploymentStrategy: {
      type: 'RollingUpdate',
    },

    image: {
      registry: 'docker.io',
      repository: 'nginxinc/nginx-unprivileged',
      tag: '1.27-alpine',
      digest: null,
      pullPolicy: 'IfNotPresent',
    },

    priorityClassName: null,
    annotations: {},
    podAnnotations: {},
    podLabels: {},
    extraArgs: [],
    extraEnv: [],
    extraEnvFrom: [],
    lifecycle: {},
    extraVolumes: [],
    extraVolumeMounts: [],

    podSecurityContext: {
      fsGroup: 101,
      runAsGroup: 101,
      runAsNonRoot: true,
      runAsUser: 101,
    },

    containerSecurityContext: {
      readOnlyRootFilesystem: true,
      capabilities: {
        drop: ['ALL'],
      },
      allowPrivilegeEscalation: false,
    },

    resources: {},
    extraContainers: [],
    terminationGracePeriodSeconds: 30,

    affinity: {
      podAntiAffinity: {
        requiredDuringSchedulingIgnoredDuringExecution: [{
          labelSelector: {
            matchLabels: {
              'app.kubernetes.io/component': 'gateway',
            },
          },
          topologyKey: 'kubernetes.io/hostname',
        }],
      },
    },

    dnsConfig: {},
    nodeSelector: {},
    topologySpreadConstraints: [],
    tolerations: [],

    service: {
      port: 80,
      type: 'ClusterIP',
      clusterIP: null,
      nodePort: null,
      loadBalancerIP: null,
      annotations: {},
      labels: {},
    },

    ingress: {
      enabled: false,
      ingressClassName: '',
      annotations: {},
      labels: {},
      hosts: [{
        host: 'gateway.loki.example.com',
        paths: [{
          path: '/',
        }],
      }],
      tls: [{
        secretName: 'loki-gateway-tls',
        hosts: ['gateway.loki.example.com'],
      }],
    },

    basicAuth: {
      enabled: false,
      username: null,
      password: null,
      htpasswd: |||
        {{ if .Values.loki.tenants }}
        {{- range $t := .Values.loki.tenants }}
        {{ htpasswd (required "All tenants must have a 'name' set" $t.name) (required "All tenants must have a 'password' set" $t.password) }}
        {{- end }}
        {{ else }}
        {{ htpasswd (required "'gateway.basicAuth.username' is required" .Values.gateway.basicAuth.username) (required "'gateway.basicAuth.password' is required" .Values.gateway.basicAuth.password) }}
        {{ end }}
      |||,
      existingSecret: null,
    },

    readinessProbe: {
      httpGet: {
        path: '/',
        port: 'http-metrics',
      },
      initialDelaySeconds: 15,
      timeoutSeconds: 1,
    },

    nginxConfig: {
      schema: 'http',
      enableIPv6: true,
      logFormat: |||
        main '$remote_addr - $remote_user [$time_local]  $status '
                '"$request" $body_bytes_sent "$http_referer" '
                '"$http_user_agent" "$http_x_forwarded_for"';
      |||,
      serverSnippet: '',
      httpSnippet: '{{ if .Values.loki.tenants }}proxy_set_header X-Scope-OrgID $remote_user;{{ end }}',
      clientMaxBodySize: '4M',
      ssl: false,
      customReadUrl: null,
      customWriteUrl: null,
      customBackendUrl: null,
      resolver: '',
      file: |||
        {{- include "loki.nginxFile" . | indent 2 -}}
      |||,
    },
  },
}