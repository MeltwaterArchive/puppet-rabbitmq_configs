class rabbitmq_configs::exchanges {
  $rmq_exchanges = hiera('rabbitmq_configs::rabbitmq_exchanges', {})
  create_resources('rabbitmq_exchange', $rmq_exchanges)
}
