class python::packages::simplejson(
  virtualenv = undef
) {
  include python
  if $virtualenv {
    python::pip{'simplejson':
      virtualenv => $virtualenv,
    }
  } else {
    package{'python-simplejson':
      ensure => installed,
    }
  }
}
