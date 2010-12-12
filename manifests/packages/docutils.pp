class python::packages::docutils(
  $virtualenv = undef
) {
  include python
  if $virtualenv {
    python::pip{'docutils':
      virtualenv => $virtualenv,
    }
  } else {
    package{"python-docutils":
      ensure => installed,
    }
  }
}
