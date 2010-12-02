class python::packages::lxml {
  include python
  package{[ 'libxml2', 'libxml2-devel' ]:
    ensure => installed,
  }
  python::pip{'lxml':
    ensure => installed,
    require => [
      Package['libxml2'],
      Package['libxml2-devel'],
    ],
  }
}
