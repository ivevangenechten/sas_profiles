class profiles::activedirectory {

  package { 'samba':
    ensure => 'present',
  }

  package { 'winbind':
    ensure => 'present',
  }

  package { 'krb5-user':
    ensure => 'present',
  }

  package { 'libpam-winbind':
    ensure => 'present',
  }

  service { 'smbd':
    ensure => 'running',
  }

  service { 'winbind':
    ensure => 'running',
  }

  file { '/etc/samba/smb.conf':
    path    => '/etc/samba/smb.conf',
    source  => "puppet:///modules/sas_profiles/smb.conf",
    require => Package['samba'],
    owner   => root, group => 0, mode => 0644,
    notify  => Service['smbd'],
  }

  file { '/etc/nsswitch.conf':
    path    => '/etc/nsswitch.conf',
    source  => "puppet:///modules/sas_profiles/nsswitch.conf",
    require => Package['winbind'],
    owner   => root, group => 0, mode => 0644,
    notify  => Service['winbind'],
  }

}