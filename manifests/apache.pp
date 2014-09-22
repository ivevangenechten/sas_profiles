class profiles::apache {

  package { 'apache2':
    ensure => 'present',
  }

}