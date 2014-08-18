class profiles::jenkins {

  ## Hiera lookups
  $url = hiera('profiles::jenkins::url')

  class { '::jenkins':
    configure_firewall => false,
    install_java => false,
  }

  class { '::apache':
  }

  a2mod { "Enable proxy mod":
    name => "proxy",
    ensure => "present",
  }

  a2mod { "Enable proxy_http mod":
    name => "proxy_http",
    ensure => "present",
  }

  apache::vhost::proxy { "jenkins":
    servername => "${url}",
    port => 80,
    dest => "http://${$url}:8080",
    vhost_name => "jenkins",
  }

}