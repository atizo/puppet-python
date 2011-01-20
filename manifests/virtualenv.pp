define python::virtualenv(
  $ensure = present,
  $interpreter = 'python',
  $no_site_packages = undef,
  $owner = root,
  $group = root,
  $mode = 750
) {
  require python::packages::virtualenv
  case $ensure {
    /present|installed/: {
      case $interpreter {
        'python': {
          require python
        }
        'python26': {
          require python::python26
        }
      }
      if $no_site_packages {
        $no_site_packages_arg = "--no-site-packages"
      }
      file{$name:
        ensure => directory,
        owner => $owner, group => $group, mode => $mode;
      }
      file{"$name/lib/pkgconfig":
        ensure => directory,
        owner => $owner, group => $group, mode => $mode;
      }
      exec{"virtualenv-$name":
        command => "virtualenv -p $interpreter $no_site_packages_arg $name",
        user => $owner,
        group => $group,
        onlyif => "test ! -f $name/bin/activate",
        require => File[$name],
        before => File["$name/lib/pkgconfig"],
        notify => Exec["virtualenv-$name-update-pip"],
      }
      exec{"virtualenv-$name-update-pip":
        command => "$name/bin/pip -E $name install -U pip",
        user => $owner,
        group => $group,
        refreshonly => true,
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
