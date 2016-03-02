class rabbitmq_configs::plugins {
  $rmq_plugins = hiera('rabbitmq_configs::rabbitmq_plugins', {})
  create_resources('rabbitmq_plugin', $rmq_plugins)
}
