

module "service_account" {
  source  = "terraform-google-modules/service-accounts/google"
  version = "4.2.1"

  project_id = var.project_id

  names = [
    var.service_account
  ]

  project_roles = [
    format("%s=>%s", var.project_id, var.role)
  ]
}

module "iam" {
  source  = "terraform-google-modules/iam/google//modules/service_accounts_iam"
  version = "7.6.0"

  project = var.project_id

  service_accounts = [
    module.service_account.email
  ]
  mode = "authoritative"

  bindings = {
    "roles/iam.workloadIdentityUser" = [
      format("serviceAccount:%s.svc.id.goog[%s/%s]", var.project_id, var.namespace, var.service_account)
    ]
  }
}


resource "google_project_iam_member" "secret-admin" {
  project = var.project_id
  role    = var.role
  member = module.service_account.iam_email
}

output "project_member" {
  description = "workload identity member"
  value       = google_project_iam_member.secret-admin
}
