define python::pip26(
  $ensure,
  $path = undef,
  $version = undef
) {
  require gcc
  require python26
  require python::packages26::pip
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
      exec{"pip26-install-$name$install_version":
        command => "$pip install $source$install_version",
        onlyif => "test `$pip freeze | grep -i '^$name==$version' | wc -l` -eq 0",
        timeout => "-1",
      }
    }
    absent: {
      exec{"pip26-uninstall-$name$install_version":
        command => "$pip uninstall $source$install_version",
        onlyif => "test `$pip freeze | grep -i '^$name==$version' | wc -l` -gt 0",
        timeout => "-1",
      }
    }
  }
}
