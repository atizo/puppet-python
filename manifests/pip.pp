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
  if $python::python26 {
    $pip = 'pip-python26'
    $pip_require = Package['python26-pip']
  } else {
    $pip = 'pip-python'
    $pip_require = Package['python-pip']
  }
  case $ensure {
    /present|installed/: {
      exec{"pip-install-$name-$version":
        command => "$pip install $source",
        onlyif => "test `$pip freeze | grep '^$name==' | wc -l` -eq 0",
        timeout => "-1",
        require => $pip_require,
      }
    }
    absent: {
      exec{"pip-uninstall-$name-$version":
        command => "$pip uninstall $source",
        onlyif => "test `$pip freeze | grep '^$name==' | wc -l` -gt 0",
        timeout => "-1",
        require => $pip_require,
      }
    }
  }
}
