class profiles::aegir_mysql {

  $root_password = hiera('profiles::mysql::passwords::root')

  class { '::mysql::server':
    root_password => $root_password,
  }

}