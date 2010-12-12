class python::packages::hashlib(
  virtualenv = undef
) {
  include python
  if $virtualenv {
    python::pip{'hashlib':
      virtualenv => $virtualenv,
    }
  } else {
    package{'python-hashlib':
      ensure => installed,
    }
  }
}
