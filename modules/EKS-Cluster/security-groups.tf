resource "aws_security_group" "all_worker_mgmt" {
  name_prefix = "all_worker_management"
  vpc_id      = module.vpc.vpc_id
}

# Inbound HTTP rule for port 80
resource "aws_security_group_rule" "all_worker_mgmt_http_ingress" {
  description       = "allow inbound HTTP traffic (port 80)"
  from_port         = 80
  protocol          = "tcp"
  to_port           = 80
  security_group_id = aws_security_group.all_worker_mgmt.id
  type              = "ingress"
  cidr_blocks = [
    "10.0.0.0/8",
    "172.16.0.0/12",
    "192.168.0.0/16",
  ]
}

# Inbound HTTPS rule for port 443
resource "aws_security_group_rule" "all_worker_mgmt_https_ingress" {
  description       = "allow inbound HTTPS traffic (port 443)"
  from_port         = 443
  protocol          = "tcp"
  to_port           = 443
  security_group_id = aws_security_group.all_worker_mgmt.id
  type              = "ingress"
  cidr_blocks = [
    "10.0.0.0/8",
    "172.16.0.0/12",
    "192.168.0.0/16",
  ]
}

# Inbound Kubernetes node port rule for port range 30000-32767
resource "aws_security_group_rule" "all_worker_mgmt_nodeports_ingress" {
  description       = "allow inbound traffic for Kubernetes node ports"
  from_port         = 30000
  protocol          = "tcp"
  to_port           = 32767
  security_group_id = aws_security_group.all_worker_mgmt.id
  type              = "ingress"
  cidr_blocks = [
    "10.0.0.0/8",
    "172.16.0.0/12",
    "192.168.0.0/16",
  ]
}

# Existing inbound rule for all traffic (allowing traffic from private CIDR ranges)
resource "aws_security_group_rule" "all_worker_mgmt_ingress" {
  description       = "allow inbound traffic from eks"
  from_port         = 0
  protocol          = "-1"
  to_port           = 0
  security_group_id = aws_security_group.all_worker_mgmt.id
  type              = "ingress"
  cidr_blocks = [
    "10.0.0.0/8",
    "172.16.0.0/12",
    "192.168.0.0/16",
  ]
}

# Outbound rule allowing all traffic (egress)
resource "aws_security_group_rule" "all_worker_mgmt_egress" {
  description       = "allow outbound traffic to anywhere"
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.all_worker_mgmt.id
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}