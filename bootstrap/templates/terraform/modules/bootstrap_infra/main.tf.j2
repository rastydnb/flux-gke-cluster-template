resource "helm_release" "cilium" {
  name       = "cilium"
  repository = "https://helm.cilium.io/"
  chart      = "cilium"
  namespace  = "networking"
  version    = "1.15.1"
  create_namespace = true

  values = [
    file("${path.root}/cilium_init.yaml")
  ]
}

resource "helm_release" "flux" {
  repository       = "https://fluxcd-community.github.io/helm-charts"
  chart            = "flux2"
  name             = "flux2"
  namespace        = "flux-system"
  create_namespace = true
  values = ["${path.root}/flux_init.yaml"]
  depends_on = [ helm_release.cilium ]
}
