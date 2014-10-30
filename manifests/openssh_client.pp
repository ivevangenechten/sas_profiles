class profiles::openssh_client {

  class { '::ssh::client':
    storeconfigs_enabled => true,
  }

}