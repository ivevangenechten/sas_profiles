class profiles::users {

  define add ($user = $name, $ensure, $uid, $gid, $home, $system = false, $groups, $mode = '0750') {
    user { $user:
      ensure => $ensure,
      uid => $uid,
      gid => $gid,
      purge_ssh_keys => true,
      home => $home,
      system => $system,
      groups => $groups,
    }

    file { "${home}/.ssh":
      ensure => directory,
      owner => $user,
      group => $user,
      mode => '0700',
      require => File["${home}"],
    }

    file { "${home}":
      ensure => directory,
      owner => $user,
      group => $user,
      mode => $mode,
      require => User["${user}"],
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