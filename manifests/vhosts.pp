class rabbitmq_configs::vhosts {
  $rmq_vhosts = hiera('rabbitmq_configs::rabbitmq_vhosts', {})
  create_resources('rabbitmq_vhost', $rmq_vhosts)
}
