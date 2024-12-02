output "private_zone1_id" {
  value       = aws_subnet.private_zone1.id
  description = "The id private zone 1"
}

output "private_zone2_id" {
  value       = aws_subnet.private_zone2.id
  description = "The id private zone 2"
}
