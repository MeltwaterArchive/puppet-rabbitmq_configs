class rabbitmq_configs::users {
  $rmq_users = hiera('rabbitmq_configs::rabbitmq_users', {})
  create_resources('rabbitmq_user', $rmq_users)
}
