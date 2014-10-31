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
    source  => "puppet:///modules/profiles/smb.conf",
    require => Package['samba'],
    owner   => root, group => 0, mode => 0644,
    notify  => Service['smbd'],
  }

  file { '/etc/nsswitch.conf':
    path    => '/etc/nsswitch.conf',
    source  => "puppet:///modules/profiles/nsswitch.conf",
    require => Package['winbind'],
    owner   => root, group => 0, mode => 0644,
    notify  => Service['winbind'],
  }

  file { '/etc/krb5.conf':
    path    => '/etc/krb5.conf',
    source  => "puppet:///modules/profiles/krb5.conf",
    require => [ Package['samba'], Package['winbind'] ],
    owner   => root, group => 0, mode => 0644,
    notify  => [ Service['winbind'], Service['smbd'] ],
  }

}