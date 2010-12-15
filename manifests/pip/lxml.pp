class python::pip::lxml {
  include python
  package{[ 'libxml2-devel', 'libxslt-devel' ]:
    ensure => installed,
    before => Python::Pip['lxml'],
  }
  python::pip{'lxml':
    ensure => installed,
  }
}
