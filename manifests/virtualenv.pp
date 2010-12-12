define python::virtualenv(
  $ensure = present,
  $interpreter = 'python',
  $no-site-packages = false,
) {
  python::pip{'virtualenv':
    ensure => installed,
  }
  case $ensure {
    /present|installed/: {
      if $no-site-packages {
        $no-site-packages-arg = "--no-site-packages",
      }
      exec{"virtualenv-$name":
        command => "virtualenv -p $interpreter $no-site-packages-arg '$name'",
        onlyif => "test ! -d '$name'",
        require => Python::Pip['virtualenv'],
      }
    }
    absent: {
      file{$name:
        ensure => absent,
        purge => true,
      }
    }
  }
}
