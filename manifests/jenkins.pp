class profiles::jenkins {

  ## Hiera lookups
  $url = hiera('profiles::jenkins::url')

  class { '::jenkins':
    configure_firewall => false,
    install_java => false,
  }

  class { '::apache':
    default_mods => ['proxy', 'proxy_http'],
  #  default_confd_files => false,
  }

$a = $::operatingsystem == 'Ubuntu'
$b = $::operatingsystemrelease >= 13.10

notify {"Apache version decided on ${::apache::apache_version}":}
notify {"Ubuntu? ${a}":}
notify {"Release >= 13.10? ${b}":}

#class { '::apache::mod::proxy': }
  #class { '::apache::mod::proxy_http': }

  #apache::vhost { $url:
  #  port => '80',
  #  docroot => '/var/www',
  #  proxy_dest => "http://${url}:8080/",
  #}

}