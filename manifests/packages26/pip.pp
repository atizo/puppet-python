class python::packages26::pip{
  include python::python26
  package{'python26-pip':
    ensure => installed,
  }
}
