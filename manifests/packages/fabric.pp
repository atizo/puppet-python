class python::packages::fabric(
  version => undef
) {
  include pytho
  python::pip{'fabric':
    ensure => installed,
    version => $version,
  }
}
