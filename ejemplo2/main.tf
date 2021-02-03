terraform {
    required_providers {
        docker = {
            source = "kreuzwerker/docker"
        }
    }
}

provider "docker" { }

resource "docker_image" "imagen-nginx" {
  name = "${var.nombre_imagen}:${var.version_imagen}"
}

resource "docker_container" "contenedores-nginx-diferentes" {
  for_each = var.nombre_contenedores
  # La variable each me da: each.key y un each.value
  name  = each.key
  image = docker_image.imagen-nginx.latest
  ports {
    internal = 80
    external = each.value 
  }
}

resource "docker_container" "contenedores-nginx-iguales" {
  count = length(var.lista_contenedores)
  name  = "mi_contenedor_nginx_${count.index}"
  image = docker_image.imagen-nginx.latest
  ports {
    internal = 80
    external = 8080 + count.index
  }
}