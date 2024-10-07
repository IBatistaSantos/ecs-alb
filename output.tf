output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "ecs_cluster_id" {
  value = module.ecs_cluster.cluster_id
}

output "ecs_service_name" {
  value = module.ecs_service.service_name
}

output "ecs_service_id" {
  value = module.ecs_service.service_id
}
