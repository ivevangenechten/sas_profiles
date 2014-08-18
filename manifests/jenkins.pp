class profiles::jenkins {

  ## Hiera lookups
  $url = hiera('profiles::jenkins::url')

  class { '::jenkins':
    configure_firewall => false,
    install_java => false,
  }

  class { '::apache':
    default_mods => ['proxy', 'proxy_http'],
    conf_template => ''puppet:///modules/profiles/apache2.conf.erb',
  }

#class { '::apache::mod::proxy': }
  #class { '::apache::mod::proxy_http': }

  #apache::vhost { $url:
  #  port => '80',
  #  docroot => '/var/www',
  #  proxy_dest => "http://${url}:8080/",
  #}

}