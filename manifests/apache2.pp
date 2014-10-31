class profiles::apache2 {

  package { 'apache2':
    ensure => 'present',
  }

}