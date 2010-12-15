class python::pip::elementtidy(
  $virtualenv = undef
) {
  include python
  package{[ 'libtidy', 'libtidy-devel' ]:
    ensure => installed,
    before => Python::Pip['elementtidy'],
  }
  python::pip{'elementtidy':
    path => 'http://effbot.org/media/downloads/elementtidy-1.0-20050212.zip',
    ensure => installed,
    virtualenv => $virtualenv,
  }
}
