class profiles::ssh {
  class { 'ssh':
    storeconfigs_enabled => false,
    server_options => {
      'Match User www-data' => {
        'ChrootDirectory' => '%h',
        'ForceCommand' => 'internal-sftp',
        'PasswordAuthentication' => 'yes',
        'AllowTcpForwarding' => 'no',
        'X11Forwarding' => 'no',
      },
      Port => [22, 2222, 2288],
    },
  }
}