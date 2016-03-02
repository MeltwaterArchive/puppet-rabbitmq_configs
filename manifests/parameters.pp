class rabbitmq_configs::parameters {
  $rmq_parameters = hiera('rabbitmq_configs::rabbitmq_parameters', {})
  create_resources('rabbitmq_parameter', $rmq_parameters)
}
