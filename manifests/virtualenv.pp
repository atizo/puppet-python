define python::virtualenv(
  $ensure = present,
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
    }
    absent: {
      file{$name:
        ensure => absent,
        purge => true,
      }
    }
  }
}
