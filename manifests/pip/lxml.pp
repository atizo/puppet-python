class python::pip::lxml(
  virtualenv = undef
) {
  include python
  package{[ 'libxml2-devel', 'libxslt-devel' ]:
    ensure => installed,
    before => Python::Pip['lxml'],
  }
  python::pip{'lxml':
    virtualenv => $virtualenv,
  }
}
