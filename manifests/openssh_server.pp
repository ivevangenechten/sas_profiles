class profiles::openssh_server {

  class { '::ssh::server':
  }

}