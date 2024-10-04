resource "aws_instance" "vault-softhsm" {
  #ami             = var.ami_id
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t4g.micro"
  key_name        = var.ami_key_pair_name
  security_groups = ["${aws_security_group.vault-softhsm-sg.id}"]
  tags = {
    Name = "${random_pet.name.id}"
  }
  subnet_id = aws_subnet.vault-softhsm-subnet.id

}
