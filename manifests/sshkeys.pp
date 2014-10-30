class profiles::sshkeys {

  sshkey { "${fqdn}_dsa":
    host_aliases => [ "$fqdn", "$hostname", "$ipaddress" ],
    type         => dsa,
    key          => $sshdsakey,
    ensure       => present,
  }
  sshkey { "${fqdn}_rsa":
    host_aliases => [ "$fqdn", "$hostname", "$ipaddress" ],
    type         => rsa,
    key          => $sshrsakey,
    ensure       => present,
  }

}