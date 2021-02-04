terraform {
    required_providers {
         aws = {
                source ="hashicorp/aws"
            }
    }
}

provider "aws" {
    profile = "default"
    region = "eu-west-1"
}


module "maquina-amazon" {
    source  = "./maquina"
    nombre_imagen = "ami-0176d5cc50152c509"
    tipo_instancia = "t2.micro"
    nombre_maquina = "ClaudioMachine"
}

