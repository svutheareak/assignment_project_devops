resource "aws_elasticache_cluster" "this" {
  count = var.cluster_enabled ? 1 : 0
  cluster_id           = "${var.name}-cache"
  engine               = "redis"
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  parameter_group_name = "default.redis6.x"
}
