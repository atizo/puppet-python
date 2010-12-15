define python::virtualenv::package(
  $ensure = installed,
  $virtualenv = undef,
) {
  import '../pip/*.pp'
  if defined("python::pip::$name") {
    include "python::pip::$name"
  } else {
    python::pip{$name:
      ensure => installed,
    }
  }
}
