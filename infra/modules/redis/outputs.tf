output "redis_endpoint" { value = aws_elasticache_cluster.this.*.cache_nodes[*].address }
