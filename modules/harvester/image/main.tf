resource "harvester_image" "image" {
  count        = var.create_image == true ? 1 : 0
  name         = "${var.prefix}-${var.image_name}"
  namespace    = var.image_namespace
  display_name = "${var.prefix}-${var.image_name}"
  source_type  = "download"
  url          = var.image_url
}
