class python::packages::fabric(
  $version = undef
) {
  include python
  python::pip{'fabric':
    ensure => installed,
    version => $version,
  }
}
