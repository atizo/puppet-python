class python::packages::fabric {
  include python
  python::pip{'fabric':
    ensure => installed,
  }
}
