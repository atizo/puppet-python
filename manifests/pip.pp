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
    $pip_version = "==$version"
  } else {
    $pip_version = $source
  }
  case $ensure {
    /present|installed/: {
      exec{"pip-install-$name-$version":
        command => "pip-python install $source$pip_version",
        onlyif => "test `$pip freeze | grep '^$name==' | wc -l` -eq 0",
        timeout => "-1",
        require => Package['python-pip'],
      }
    }
    absent: {
      exec{"pip-uninstall-$name-$version":
        command => "pip-python uninstall $source$pip_version",
        onlyif => "test `$pip freeze | grep '^$name==' | wc -l` -gt 0",
        timeout => "-1",
        require => Package['python-pip'],
      }
    }
  }
}
