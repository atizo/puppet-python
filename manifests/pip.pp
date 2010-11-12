define python::pip(
  $ensure,
  $path = undef,
  $version = undef
) {
  require python::packages::pip
  require python::devel
  require gcc
  if $path {
    $source = $path
  } else {
    $source = $name
  }
  case $ensure {
    /present|installed/: {
      exec{"pip-install-$name-$version":
        command => "pip install $source",
        onlyif => "test `pip freeze | grep '^$name==' | wc -l` -eq 0",
        timeout => "-1",
        require => Package['python-pip'],
      }
    }
    absent: {
      exec{"pip-uninstall-$name-$version":
        command => "pip uninstall $source",
        onlyif => "test `pip freeze | grep '^$name==' | wc -l` -gt 0",
        timeout => "-1",
        require => Package['python-pip'],
      }
    }
  }
}
