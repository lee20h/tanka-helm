local k = import 'k.libsonnet';

// 외부에서 namespace 값을 받아 처리하도록 수정
function(namespace) {
  apiVersion: 'v1',
  kind: 'Namespace',
  metadata: {
    name: namespace,  // 전달받은 namespace 값 사용
  },
}
