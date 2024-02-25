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
  values = [
    file("${path.root}/flux_init.yaml")
  ]
  depends_on = [ helm_release.cilium ]
}



# module "iam_gmp" {
#     source              = "../iam"
#     project_id          = var.project_id
#     namespace           = "gmp-public"
#     service_account     = "gmp-magic"
#     role    = "roles/monitoring.metricWriter"
#     depends_on = [ helm_release.cilium ]
# }

# resource "helm_release" "kube-prometheus-stack" {
#   repository       = "oci://ghcr.io/prometheus-community/charts"
#   chart            = "kube-prometheus-stack"
#   name             = "prometheus-community"
#   namespace        = "monitoring"
#   create_namespace = true
#   values = [
#     file("${path.root}/prom_init.yaml")
#   ]
#   depends_on = [ module.iam_gmp ]
# }
