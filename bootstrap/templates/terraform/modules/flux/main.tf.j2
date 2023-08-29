resource "helm_release" "flux" {
  repository       = "https://fluxcd-community.github.io/helm-charts"
  chart            = "flux2"
  name             = "flux2"
  namespace        = "flux-system"
  create_namespace = true
  //values = [fileexists("${path.root}/${var.values_file}") == true ? file("${path.root}/${var.values_file}") : ""]
}

resource "null_resource" "flux_config" {
  depends_on = [helm_release.flux]
  provisioner "local-exec" {
    command = "kubectl apply --kustomize ../kubernetes/flux-system"
  }
   
  # provisioner "local-exec" {
  #   when    = destroy
  #   command = "kubectl delete --kustomize ../kubernetes/flux-system"
  # }
}
