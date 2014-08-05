class profiles::users {

  ## Hiera lookups
  $users = hiera_hash('profiles::users')
  $groups = hiera_hash('profiles::groups')

  create_resources('user', $users)
  create_resources('group', $groups)

}