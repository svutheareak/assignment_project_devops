variable "name" { type = string }
variable "cluster_enabled" { type = bool default = true }
variable "node_type" { type = string default = "cache.t3.micro" }
variable "num_cache_nodes" { type = number default = 1 }
