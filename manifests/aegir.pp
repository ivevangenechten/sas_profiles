class profiles::aegir {

 class { '::profiles::mysql':
    before => Class['::aegir'],
 }
 class {'::aegir': }

}