class python::packages::pip {
  include python
  package{'python-pip':
    ensure => installed,
  }
}
