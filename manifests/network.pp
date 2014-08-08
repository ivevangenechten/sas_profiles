class profiles::network {

  ## Hiera lookups
  $network_interfaces = hiera_hash('profiles::network::interfaces')
  $network_routes = hiera_hash('profiles::network::routes')

  create_resources('network_config', $network_interfaces)
  create_resources('network_route', $network_routes)

}