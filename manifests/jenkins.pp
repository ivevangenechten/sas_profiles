class profiles::jenkins {

class { '::jenkins':
  configure_firewall => false,
  install_java => false,
}


}