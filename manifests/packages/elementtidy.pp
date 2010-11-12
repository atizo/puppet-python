class python::packages::elementtidy {
  include python
  package{ [ 'libtidy', 'libtidy-devel' ]:
    ensure => installed,
  }
  python::pip{'elementtidy':
    path => 'http://effbot.org/media/downloads/elementtidy-1.0-20050212.zip',
    ensure => installed,
    require => Package['libtidy-devel'],
  }
}
