module "harvester_image" {
  source          = "../../../modules/harvester/image"
  prefix          = var.prefix
  create_image    = var.create_image
  image_name      = var.image_name
  image_namespace = var.image_namespace
  image_url       = var.image_url
}
