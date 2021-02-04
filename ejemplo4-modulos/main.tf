terraform {
    required_providers {
        docker = {
            #  He actualizado el repo del provider de docker
            source = "kreuzwerker/docker"
        }
    }
}


module "nginx" {
    source  = "./contenedor"
    nombre_imagen = "nginx"
    nombre_contenedor = "mi-nginx1"
    puertos = [
        {
          internal = 80
          external = 8090
    
      },
      {
          internal = 443
          external = 8091
        }
    ]
}


module "apache" {
    source  = "./contenedor"
    nombre_imagen = "httpd"
    nombre_contenedor = "mi-apache1"
    puertos = [
        {
          internal = 80
          external = 8092
    
      },
      {
          internal = 443
          external = 8093
        }
    ]
}
