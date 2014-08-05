class profiles::snmp {

## Hiera lookups
$agentaddress  = hiera('profiles::snmp::agentaddress')
$ro_community  = hiera('profiles::snmp::ro_community')
$ro_network    = hiera('profiles::snmp::ro_network')
$views         = hiera('profiles::snmp::views')

class { '::snmp':
  agentaddress => $agentaddress,
  ro_community => $ro_community,
  ro_network   => $ro_network,
  views        => $views,
}

}