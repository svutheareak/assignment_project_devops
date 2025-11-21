# VPC module (template)
resource "aws_vpc" "this" {
  cidr_block = var.cidr_block
  tags = merge(var.tags, { Name = "${var.name}-vpc" })
}

resource "aws_subnet" "public" {
  count = length(var.azs)
  vpc_id = aws_vpc.this.id
  cidr_block = cidrsubnet(var.cidr_block, 8, count.index)
  availability_zone = var.azs[count.index]
  map_public_ip_on_launch = true
  tags = { Name = "${var.name}-public-${count.index}" }
}

resource "aws_subnet" "private" {
  count = length(var.azs)
  vpc_id = aws_vpc.this.id
  cidr_block = cidrsubnet(var.cidr_block, 8, count.index + length(var.azs))
  availability_zone = var.azs[count.index]
  map_public_ip_on_launch = false
  tags = { Name = "${var.name}-private-${count.index}" }
}
