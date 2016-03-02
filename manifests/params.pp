  # Class: rabbitmq_configs::params
#
#   The RabbitMQ_configs Module configuration settings.
#
class rabbitmq_configs::params {

  $rabbitmq_users             = {}
  $rabbitmq_exchanges         = {}
  $rabbitmq_parameters        = {}
  $rabbitmq_plugins           = {}
  $rabbitmq_policies          = {}
  $rabbitmq_queues            = {}
  $rabbitmq_users_permissions = {}
  $rabbitmq_vhosts            = {}

}
