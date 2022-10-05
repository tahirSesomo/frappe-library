APP_NAME="library"

variable "FRAPPE_VERSION" {}
variable "ERPNEXT_VERSION" {}

group "default" {
    targets = ["backend", "frontend"]
}

target "backend" {
    dockerfile = "backend.Dockerfile"
    tags = ["library/worker:latest"]
    args = {
      "ERPNEXT_VERSION" = ERPNEXT_VERSION
      "APP_NAME" = APP_NAME
    }
}

target "frontend" {
    dockerfile = "frontend.Dockerfile"
    tags = ["library/nginx:latest"]
    args = {
      "FRAPPE_VERSION" = FRAPPE_VERSION
      "ERPNEXT_VERSION" = ERPNEXT_VERSION
      "APP_NAME" = APP_NAME
    }
}
