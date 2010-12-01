define python::pip(
  $ensure,
  $path = undef,
  $version = undef
) {
  require gcc
  include python::packages::pip
  if $path {
    $source = $path
  } else {
    $source = $name
  }
  if $version {
    $install_version = "==$version"
  }
  case $ensure {
    /present|installed/: {
      exec{"pip-install-$name-$version":
        command => "pip-python install $source$install_version",
        onlyif => "test `$pip freeze | grep '^$name==' | wc -l` -eq 0",
        timeout => "-1",
        require => Package['python-pip'],
      }
    }
    absent: {
      exec{"pip-uninstall-$name-$version":
        command => "pip-python uninstall $source$install_version",
        onlyif => "test `$pip freeze | grep '^$name==' | wc -l` -gt 0",
        timeout => "-1",
        require => Package['python-pip'],
      }
    }
  }
}
