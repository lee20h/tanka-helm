// 필요한 라이브러리 import
local tanka = import 'github.com/grafana/jsonnet-libs/tanka-util/main.libsonnet';
local helm = tanka.helm.new(std.thisFile);
local ns = import 'namespace.libsonnet';

// 기본값 설정
local defaults = {
  name: 'loki',
  namespace: 'loki',
  values: {}, // Helm 차트에 사용할 기본값 설정
};

// Helm 템플릿을 생성하는 함수
function(params) {
  local g = self(params),
  local _config = defaults + params,
  local namespace = ns(params.values)
  // Helm 템플릿 반환
  {
    loki: helm.template('loki', '../charts/loki', {
      namespace: _config.namespace,
      values: _config.values,
    })
  }
}
