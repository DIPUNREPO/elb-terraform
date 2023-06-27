#####creating first server#########

resource "aws_instance" "server1" {
  ami           = "ami-0e820afa569e84cc1"
  key_name = "dibya_ohio_keypair"
  instance_type = "t2.micro"
  security_groups = ["elb_sg"]
  user_data  =  <<EOF
#!/bin/bash
yum install httpd -y
service httpd start
chkconfig httpd on
echo "this is first server" > /var/www/html/index.html
EOF
  tags = {
    Name = "server1"
    source = "terraform"
  }
}
##############creating my second server#############

resource "aws_instance" "server2" {
  ami           = "ami-0e820afa569e84cc1"
  key_name = "dibya_ohio_keypair"
  instance_type = "t2.micro"
  security_groups = ["elb_sg"]
  user_data  =  <<EOF
#!/bin/bash
yum install httpd -y
service httpd start
chkconfig httpd on
echo "this is second server" > /var/www/html/index.html
EOF
  tags = {
    Name = "server2"
    source = "terraform"
	} 
}
