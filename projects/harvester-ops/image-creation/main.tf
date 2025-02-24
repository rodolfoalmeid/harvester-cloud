module "harvester_image" {
  source            = "../../../modules/harvester/image"
  create_image      = var.create_image
  image_name        = var.image_name
  image_namespace   = var.image_namespace
  image_source_type = var.image_source_type
  image_url         = var.image_url
}
