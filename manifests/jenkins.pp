class profiles::jenkins {

  include jenkins
  jenkins::plugin {
    "git" : ;
  }

}