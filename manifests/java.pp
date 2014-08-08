class profiles::java {

class { '::java':
    distribution => 'jdk',
    version => 'present',
}


}