class python::packages::virtualenv {
  include python
  package{'python-virtualenv':
    ensure => installed,
  }
}
