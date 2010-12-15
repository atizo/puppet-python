class python::packages::pil {
  include python
  package{'python-imaging':
    ensure => installed,
  }
}
