class profiles::aegir {

 class {'::aegir':
   require => Class['::profiles::mysql']
 }

}