define python::pip26(
  $ensure,
  $path = undef,
  $version = undef
) {
  require gcc
  include python::packages26::pip
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
      exec{"pip26-install-$name-$version":
        command => "pip-python26 install $source$pip_version",
        onlyif => "test `$pip freeze | grep '^$name==' | wc -l` -eq 0",
        timeout => "-1",
        require => Package['python-pip26'],
      }
    }
    absent: {
      exec{"pip26-uninstall-$name-$version":
        command => "pip-python26 uninstall $source$pip_version",
        onlyif => "test `$pip freeze | grep '^$name==' | wc -l` -gt 0",
        timeout => "-1",
        require => Package['python-pip26'],
      }
    }
  }
}
