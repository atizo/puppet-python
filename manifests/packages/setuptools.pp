class python::packages::setuptools {
  include python
  package{'python-setuptools':
    ensure => installed,
  }
}
