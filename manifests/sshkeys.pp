class profiles::sshkeys {

# Every node with the ssh class will export its own SSH host key and then collect the SSH host key of every node (including its own). This will cause every node in the site to trust SSH connections from every other node.

# Declare:
@@sshkey { "${fqdn}_dsa":
  host_aliases => [ "$fqdn", "$hostname", "$ipaddress" ],
  type => dsa,
  key  => $sshdsakey,
}
@@sshkey { "${fqdn}_rsa":
  host_aliases => [ "$fqdn", "$hostname", "$ipaddress" ],
  type => rsa,
  key  => $sshrsakey,
}

# Collect:
Sshkey <<| |>>

}