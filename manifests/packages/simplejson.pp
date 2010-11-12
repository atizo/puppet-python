class python::packages::simplejson {
  include python
  package{'python-simplejson':
    ensure => installed,
  }
}
