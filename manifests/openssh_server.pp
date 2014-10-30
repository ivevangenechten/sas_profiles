class profiles::openssh_server {

  class { '::ssh::server':
    storeconfigs_enabled => true,
  }

}