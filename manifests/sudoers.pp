class profiles::sudoers {

  # Groups
  sudo::conf { 'admin':
    content => '%admin ALL=(ALL) ALL',
  }
  sudo::conf { 'sudo':
    content => '%sudo ALL=(ALL) ALL',
  }

  # Users
  sudo::conf { 'root':
    content => 'root ALL=(ALL) ALL',
  }
  sudo::conf { 'beheerder':
    content => 'beheerder ALL=(ALL) NOPASSWD: ALL',
  }
  sudo::conf { 'jenkins-puppet':
    content => 'jenkins ALL=(ALL) NOPASSWD: /usr/bin/puppet',
  }

  # Special case: when provisioning a server in the dev-sas domain (Vagrant development)
  if $fqdn =~ /dev-sas.vito.local/ {
    sudo::conf { 'vagrant':
      content => '%vagrant ALL=(ALL) NOPASSWD: ALL',
    }
  }

  # Special case: special sudoers entries for hostmaster server
  if $hostname == 'hostmaster' {
    sudo::conf { 'aegir':
      content => 'aegir ALL=(ALL) NOPASSWD: ALL',
    }
  }

  # Special case: special sudoers entries for puppet server
  if $hostname == 'puppet' {
    sudo::conf { 'jenkins':
      content => 'jenkins ALL=(ALL) NOPASSWD: /usr/local/bin/r10k, /usr/bin/svn',
    }
    sudo::conf { 'foreman1':
      content => 'Defaults:foreman-proxy !requiretty',
    }
    sudo::conf { 'foreman2':
      content => 'foreman-proxy ALL = NOPASSWD: /usr/bin/puppet',
    }
  }

  # Special case: special sudoers entries for all webXX
  if $hostname =~ /web\d+/ {
    sudo::conf { 'aegir':
      content => 'aegir ALL=(ALL) NOPASSWD: /usr/sbin/apache2ctl',
    }
  }

}