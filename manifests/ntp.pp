class profiles::ntp {

  ## Hiera lookups
  $servers = hiera('profiles::ntp::servers')

  class { '::ntp':
    servers => $servers,
  }

}