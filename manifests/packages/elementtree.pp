class python::packages::elementtree(
  virtualenv = undef
) {
  include python
  if $virtualenv {
    python::pip{'elementtree':
      virtualenv => $virtualenv,
    }
  } else {
    package{'python-elementtree':
      ensure => installed,
    }
  }
}
