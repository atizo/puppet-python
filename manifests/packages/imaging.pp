class python::packages::imaging {
  include python
  package{'python-imaging':
    ensure => installed,
  }
}
