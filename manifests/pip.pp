define python::pip(
  $ensure,
  $path = undef,
  $version = undef,
  $packages = undef,
) {
  require gcc
  require python
  require python::packages::pip
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
      exec{"pip-install-$name$install_version":
        command => "$pip install $source$install_version",
        onlyif => "test `$pip freeze | grep -i '^$name==$version' | wc -l` -eq 0",
        timeout => "-1",
      }
    }
    absent: {
      exec{"pip-uninstall-$name$install_version":
        command => "$pip uninstall $source$install_version",
        onlyif => "test `$pip freeze | grep -i '^$name==$version' | wc -l` -gt 0",
        timeout => "-1",
      }
    }
  }
}
