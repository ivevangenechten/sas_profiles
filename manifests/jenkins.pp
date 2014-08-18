class profiles::jenkins {

  ## Hiera lookups
  $url = hiera('profiles::jenkins::url')

  class { '::jenkins':
    configure_firewall => false,
    install_java => false,
  }

  class { '::apache':
  #  default_mods        => false,
  #  default_confd_files => false,
  }

  #class { '::apache::mod::proxy': }
  #class { '::apache::mod::proxy_http': }

  #apache::vhost { $url:
  #  port => '80',
  #  docroot => '/var/www',
  #  proxy_dest => "http://${url}:8080/",
  #}

}