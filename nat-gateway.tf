# Allocate Elastic IP for NAT Gateway in Public Subnet AZ1
resource "aws_eip" "eip1" {
  domain = "vpc"  # Use "vpc" instead of the deprecated `vpc = true`

  tags = {
    Name = "${var.project_name}-${var.environment}-eip1"
  }
}

# Allocate Elastic IP for NAT Gateway in Public Subnet AZ2
resource "aws_eip" "eip2" {
  domain = "vpc"  # Use "vpc" instead of the deprecated `vpc = true`

  tags = {
    Name = "${var.project_name}-${var.environment}-eip2"
  }
}

# Create NAT Gateway in Public Subnet AZ1
resource "aws_nat_gateway" "nat_gateway_az1" {
  allocation_id = aws_eip.eip1.id
  subnet_id     = aws_subnet.public_subnet_az1.id

  tags = {
    Name = "${var.project_name}-${var.environment}-nat-gateway-az1"  # Updated tag for clarity
  }

  # Ensure NAT Gateway is created after the Internet Gateway
  depends_on = [aws_internet_gateway.internet_gateway]
}

# Create NAT Gateway in Public Subnet AZ2
resource "aws_nat_gateway" "nat_gateway_az2" {
  allocation_id = aws_eip.eip2.id
  subnet_id     = aws_subnet.public_subnet_az2.id

  tags = {
    Name = "${var.project_name}-${var.environment}-nat-gateway-az2"  # Updated tag for clarity
  }

  # Ensure NAT Gateway is created after the Internet Gateway
  depends_on = [aws_internet_gateway.internet_gateway]
}

# Create Private Route Table for AZ1 and Add Route Through NAT Gateway AZ1
resource "aws_route_table" "private_route_table_az1" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway_az1.id
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-private-rt-az1"
  }
}

# Associate Private App Subnet AZ1 with Private Route Table AZ1
resource "aws_route_table_association" "private_app_subnet_az1_rt_az1_association" {
  subnet_id      = aws_subnet.private_app_subnet_az1.id
  route_table_id = aws_route_table.private_route_table_az1.id
}

# Associate Private Data Subnet AZ1 with Private Route Table AZ1
resource "aws_route_table_association" "private_data_subnet_az1_rt_az1_association" {
  subnet_id      = aws_subnet.private_data_subnet_az1.id
  route_table_id = aws_route_table.private_route_table_az1.id
}

# Create Private Route Table for AZ2 and Add Route Through NAT Gateway AZ2
resource "aws_route_table" "private_route_table_az2" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway_az2.id
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-private-rt-az2"
  }
}

# Associate Private App Subnet AZ2 with Private Route Table AZ2
resource "aws_route_table_association" "private_app_subnet_az2_rt_az2_association" {
  subnet_id      = aws_subnet.private_app_subnet_az2.id
  route_table_id = aws_route_table.private_route_table_az2.id
}

# Associate Private Data Subnet AZ2 with Private Route Table AZ2
resource "aws_route_table_association" "private_data_subnet_az2_rt_az2_association" {
  subnet_id      = aws_subnet.private_data_subnet_az2.id
  route_table_id = aws_route_table.private_route_table_az2.id
}