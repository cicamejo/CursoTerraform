terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
        }
    }
}

provider "docker" { }

resource "docker_image" "imagen-ubuntu" {
# OJO, tomo el ultimo UBUNTU
// Oto comentario
/*
    Otro mas
*/
  name = "${var.nombre_imagen}:${var.version_imagen}"
}

resource "docker_container" "contenedor-ubuntu" {
  name  = "mi_contenedor_ubuntu"
  command = ["bash","-c","sleep 600"]
  image = docker_image.imagen-ubuntu.latest
  dynamic "volumes" {
    for_each = var.volumenes
    content{
          volume_name = lookup(volumes.value, "volume_name", null)
          host_path = volumes.value["host_path"]
          container_path =volumes.value["container_path"]
      }
  }
}