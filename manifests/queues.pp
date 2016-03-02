class rabbitmq_configs::queues {
  $rmq_queues = hiera('rabbitmq_configs::rabbitmq_queues', {})
  create_resources('rabbitmq_queue', $rmq_queues)
}
