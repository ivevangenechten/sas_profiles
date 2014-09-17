class profiles::users {

  define add ($user = $name, $ensure, $uid, $gid, $home) {
    user { $user:
      ensure => $ensure,
      uid => $uid,
      gid => $gid,
      purge_ssh_keys => true,
      home => $home,
      require => File["${home}/${user}/.ssh"]
    }

    file { "${home}/${user}/.ssh":
      ensure => directory,
      owner => $user,
      group => $user,
      mode => '0700',
      require => File["${home}/${user}"],
    }

    file { "${home}/${user}":
      ensure => directory,
      owner => $user,
      group => $user,
      mode => '0750',
    }

  }

  ## Hiera lookups
  $users = hiera_hash('profiles::users')
  $groups = hiera_hash('profiles::groups')
  $ssh_authorized_keys = hiera_hash('profiles::ssh_authorized_keys')

  create_resources('profiles::users::add', $users)
  create_resources('group', $groups)
  create_resources('ssh_authorized_key', $ssh_authorized_keys)

}