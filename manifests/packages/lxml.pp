class python::packages::lxml(
  virtualenv = undef
) {
  include python
  if $virtualenv {
    python::pip{'lxml':
      virtualenv => $virtualenv,
    }
  } else {
    package{'python-lxml':
      ensure => installed,
    }
  }
}
