define python::pip(
  $ensure,
  $path = undef,
  $version = undef,
  $virtualenv = undef
) {
  require gcc
  include python
  package{'python-pip':
    ensure => installed,
  }
  if $path {
    $source = $path
  } else {
    $source = $name
  }
  if $version {
    $install_version = "==$version"
  }
  if $virtualenv {
    $pip = "$name/bin/pip -E $virtualenv"
  } else {
    $pip = 'pip-python26'
  }
  case $ensure {
    /present|installed/: {
      exec{"pip-install-$name$install_version":
        command => "$pip install $source$install_version",
        onlyif => "test `$pip freeze | grep -i '^$name==$version' | wc -l` -eq 0",
        timeout => "-1",
        require => Package['python-pip'],
      }
    }
    absent: {
      exec{"pip-uninstall-$name$install_version":
        command => "$pip uninstall $source$install_version",
        onlyif => "test `$pip freeze | grep -i '^$name==$version' | wc -l` -gt 0",
        timeout => "-1",
        require => Package['python-pip'],
      }
    }
  }
}
