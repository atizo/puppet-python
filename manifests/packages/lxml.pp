class python::packages::lxml {
  include python
  package{'python-lxml':
    ensure => installed,
  }
}
