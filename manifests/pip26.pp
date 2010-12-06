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
    $install_version = "==$version"
  }
  case $ensure {
    /present|installed/: {
      exec{"pip26-install-$name$install_version":
        command => "pip-python26 install $source$install_version",
        onlyif => "test `$pip freeze | grep -i '^$name==$version' | wc -l` -eq 0",
        timeout => "-1",
        require => Package['python26-pip'],
      }
    }
    absent: {
      exec{"pip26-uninstall-$name$install_version":
        command => "pip-python26 uninstall $source$install_version",
        onlyif => "test `$pip freeze | grep -i '^$name==$version' | wc -l` -gt 0",
        timeout => "-1",
        require => Package['python26-pip'],
      }
    }
  }
}
