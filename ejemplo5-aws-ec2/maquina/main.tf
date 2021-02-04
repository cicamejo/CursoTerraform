terraform {
}

resource "aws_instance" "mi-maquina" {
  ami           = var.nombre_imagen
  instance_type = var.tipo_instancia
  tags = {
    Name = var.nombre_maquina
  }
}