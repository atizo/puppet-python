class python::packages::pycairo(
  virtualenv = undef
) {
  include python
  if $virtualenv {
    python::pip{'pycairo':
      virtualenv => $virtualenv,
    }
  } else {
    package{'python-pycairo':
      ensure => installed,
    }
  }
}
