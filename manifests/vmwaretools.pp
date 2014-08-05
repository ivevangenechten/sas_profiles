class profiles::vmwaretools {

  ## Hiera lookups
  $version = hiera('profiles::vmwaretools::version')
  $tmp = hiera('profiles::vmwaretools::working_dir')


  class { '::vmwaretools':
    version => $version,
    working_dir => $tmp,
  }

}