resource "aws_route" "igateway" {
  route_table_id          = "${aws_route_table.public_id}"
  destination_cidr_block  = "0.0.0.0/0"
  gateway_id              = "${aws_internet_gateway.gw.id}"
}
