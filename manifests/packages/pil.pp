class python::packages::pil(
  virtualenv = undef
) {
  include python
  if $virtualenv {
    python::pip{'pil':
      virtualenv => $virtualenv,
    }
  } else {
    package{'python-imaging':
      ensure => installed,
    }
  }
}
