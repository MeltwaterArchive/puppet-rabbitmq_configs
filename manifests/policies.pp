class rabbitmq_configs::policies {
  $rmq_policies = hiera('rabbitmq_configs::rabbitmq_policies', {})
  create_resources('rabbitmq_policy', $rmq_policies)
}
