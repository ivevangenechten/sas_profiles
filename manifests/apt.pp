class profiles::apt {

  ## Hiera lookups
  $always_apt_update   = hiera('profiles::apt::always_apt_update')
  $proxy_host          = hiera('profiles::apt::proxy_host')
  $proxy_port          = hiera('profiles::apt::proxy_port')

  class { '::apt':
    always_apt_update  => $always_apt_update,
    proxy_host         => $proxy_host,
    proxy_port         => $proxy_port,
  }

}