class profiles::jenkins {

include jenkins
jenkins::plugin {
  "git" : ;
}
jenkins::plugin {
  "subversion" : ;
}


}