class python::packages::pip {
  include python
  if $python::python26 {
    package{'python26-pip':
      ensure => installed,
    }
  }
  package{'python-pip':
    ensure => installed,
  }
}
