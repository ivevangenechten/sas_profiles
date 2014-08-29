class profiles::jenkins {

  ## Hiera lookups
  $url = hiera('profiles::jenkins::url')

  class { '::jenkins':
    configure_firewall => false,
    install_java => false,
  }

  class { '::apacheproxy':
    server_admin => 'tom.sneyers@vito.be',
    server_name => 'jenkins.sas.vito.local',
    destination_url => 'http://jenkins.sas.vito.local:8080/',
  }


}