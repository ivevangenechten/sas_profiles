class profiles::users {

  ## Hiera lookups
  $users = hiera_hash('profiles::users')
  $groups = hiera_hash('profiles::groups')
  $ssh_authorized_keys = hiera_hash('profiles::ssh_authorized_keys')

  create_resources('user', $users)
  create_resources('group', $groups)
  create_resources('ssh_authorized_keys', $ssh_authorized_keys)

}