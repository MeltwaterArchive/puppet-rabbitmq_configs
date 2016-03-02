# Main rabbitmq_configs class
class rabbitmq_configs(
  $rabbitmq_users              = $rabbitmq_configs::params::rabbitmq_users,
  $rabbitmq_exchanges          = $rabbitmq_configs::params::rabbitmq_exchanges,
  $rabbitmq_parameters         = $rabbitmq_configs::params::rabbitmq_parameters,
  $rabbitmq_plugins            = $rabbitmq_configs::params::rabbitmq_plugins,
  $rabbitmq_policies           = $rabbitmq_configs::params::rabbitmq_policies,
  $rabbitmq_queues             = $rabbitmq_configs::params::rabbitmq_queues,
  $rabbitmq_users_permissions  = $rabbitmq_configs::params::rabbitmq_users_permissions,
  $rabbitmq_vhosts             = $rabbitmq_configs::params::rabbitmq_vhosts,
) inherits rabbitmq_configs::params {

  validate_hash($rabbitmq_users)
  validate_hash($rabbitmq_exchanges)
  validate_hash($rabbitmq_parameters)
  validate_hash($rabbitmq_plugins)
  validate_hash($rabbitmq_policies)
  validate_hash($rabbitmq_queues)
  validate_hash($rabbitmq_users_permissions)
  validate_hash($rabbitmq_vhosts)  

  include '::rabbitmq_configs::vhosts'
  include '::rabbitmq_configs::exchanges'
  include '::rabbitmq_configs::queues'  
  include '::rabbitmq_configs::plugins'
  include '::rabbitmq_configs::policies'
  include '::rabbitmq_configs::users'
  include '::rabbitmq_configs::users_permissions'
  include '::rabbitmq_configs::parameters'
  

  # Anchor this as per #8040 - this ensures that classes won't float off and
  # mess everything up.  You can read about this at:
  # http://docs.puppetlabs.com/puppet/2.7/reference/lang_containment.html#known-issues
  anchor { 'rabbitmq_configs::begin': }
  anchor { 'rabbitmq_configs::end': }

  Anchor['rabbitmq_configs::begin']
    -> Class['::rabbitmq_configs::vhosts'] -> Class['::rabbitmq_configs::exchanges']
    -> Class['::rabbitmq_configs::queues'] -> Class['::rabbitmq_configs::plugins']
    -> Class['::rabbitmq_configs::policies'] -> Class['::rabbitmq_configs::users']
    -> Class['::rabbitmq_configs::users_permissions'] -> Class['::rabbitmq_configs::parameters']
    -> Anchor['rabbitmq_configs::end']

}
