class profiles::aegir (
  $install_aegir   = true,
  $install_mysql   = true,
  $install_apache2 = true
) {

  class { '::aegir':
    install_aegir    => profiles::aegir::install_aegir,
    install_mysql    => profiles::aegir::install_mysql,
    install_apache2  => profiles::aegir::install_apache2
  }

}