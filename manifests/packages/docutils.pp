class python::packages::docutils {
  include python
  package{'python-docutils':
    ensure => installed,
  }
}
