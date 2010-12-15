define python::virtualenv(
  $ensure = present,
  $pip_packages = undef,
  $interpreter = 'python',
  $no_site_packages = undef,
) {
  require python::packges::virtualenv
  case $ensure {
    /present|installed/: {
      if $no_site_packages {
        $no_site_packages_arg = "--no-site-packages"
      }
      exec{"virtualenv-$name":
        command => "virtualenv -p $interpreter $no_site_packages_arg '$name'",
        onlyif => "test ! -d '$name'",
        require => Python::Pip['virtualenv'],
      }
      if $pip_packages {
        python::virtualenv::package{$pip_packages:}
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
