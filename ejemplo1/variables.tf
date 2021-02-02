variable "nombre_imagen" {
    description = "Nombre de la imagen que voy a descargar"
    type = string
    default = "ubuntu"
}

variable "version_imagen" {
    description = "Version de la imagen que voy a descargar"
    type = string
    default = "21.04"
}


variable "volumenes" {
    description = "Volumenes que vamos a montar en el contenedor"
    type = list(map(string))
    default = [
        {
          host_path = "/home/ubuntu/environment/CursoTerraform"
          container_path ="/CursoTerraform"
    
      },
      {
          volume_name = "vol_ivan"
          host_path = "/home/ubuntu/environment/ivan"
          container_path ="/ivan"
    
      }
    ]
}