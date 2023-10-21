
resource "tls_private_key" "terra_pvt_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ec2_key_pair" {
  key_name   = "ec2_key"
  public_key = tls_private_key.terra_pvt_key.public_key_openssh
}

resource "local_file" "private_key"{
    content = tls_private_key.terra_pvt_key.private_key_pem
            filename = "ec2_key_pvt"
    }

