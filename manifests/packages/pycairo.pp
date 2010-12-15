class python::packages::pycairo {
  include python
  package{'python-pycairo':
    ensure => installed,
  }
}
