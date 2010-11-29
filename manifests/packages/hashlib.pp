class python::packages::hashlib {
  include python
  package{'python-hashlib':
    ensure => installed,
  }
}
