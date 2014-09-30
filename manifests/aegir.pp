class profiles::aegir {

 class { '::profiles::aegir_mysql':
  before => Class['::aegir'],
 }
 class {'::aegir': }

}