class profiles::php5 {

  package { 'php5':
    ensure => 'present',
  }
  package { 'php5-gd':
    ensure => 'present',
  }
  package { 'php5-ldap':
    ensure => 'present',
  }
  package { 'php5-curl':
    ensure => 'present',
  }
  package { 'php5-json':
    ensure => 'present',
  }
  package { 'php5-apc':
    ensure => 'present',
  }

}