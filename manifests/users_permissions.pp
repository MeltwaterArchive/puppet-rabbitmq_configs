class rabbitmq_configs::users_permissions {
  $rmq_users_permissions = hiera('rabbitmq_configs::rabbitmq_users_permissions', {})
  create_resources('rabbitmq_user_permissions', $rmq_users_permissions)
}
