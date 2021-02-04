
output "direccion_ip" {
    value = aws_instance.mi-maquina.public_ip
}
output "espacio_disco" {
    value = aws_instance.mi-maquina.root_block_device[0].volume_size
}
