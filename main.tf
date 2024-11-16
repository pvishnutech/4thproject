variable "ContainerName" {
  description = "Value of the name for the Docker container"
  type        = string
  default     = "ExampleNginxContainer"
}


terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  host = "npipe:////.//pipe//docker_engine"
}

resource "docker_image" "nginx" {
  name         = "nginx"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = var.ContainerName

  ports {
    internal = 80
    external = 8082
  }
}