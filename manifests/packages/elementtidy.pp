class python::packages::elementtidy(
  $virtualenv = undef
) {
  include python
  package{[ 'libtidy', 'libtidy-devel' ]:
    ensure => installed,
  }
  python::pip{'elementtidy':
    path => 'http://effbot.org/media/downloads/elementtidy-1.0-20050212.zip',
    ensure => installed,
    virtualenv => $virtualenv,
    require => [
      Package['libtidy'],
      Package['libtidy-devel'],
    ],
  }
}
