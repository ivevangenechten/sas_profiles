class profiles::vmwaretools {

  ## Hiera lookups
  $archive_url = hiera('profiles::vmwaretools::archive_url')
  $version = hiera('profiles::vmwaretools::version')
  $tmp = hiera('profiles::vmwaretools::working_dir')


  class { '::vmwaretools':
    archive_url => $archive_url,
    version => $version,
    working_dir => $tmp,
  }

}