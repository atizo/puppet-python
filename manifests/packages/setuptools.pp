class python::packages::setuptools(
  virtualenv = undef
) {
  include python
  if $virtualenv {
    python::pip{'setuptools':
      virtualenv => $virtualenv,
    }
  } else {
    package{'python-setuptools':
      ensure => installed,
    }
  }
}

