resource "harvester_image" "image" {
  count        = var.create_image == true ? 1 : 0
  name         = var.image_name
  namespace    = var.image_namespace
  display_name = var.image_name
  source_type  = var.image_source_type
  url          = var.image_url
}
