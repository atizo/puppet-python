class python::packages::feedparser(
  virtualenv = undef
) {
  include python
  if $virtualenv {
    python::pip{'feedparser':
      virtualenv => $virtualenv,
    }
  } else {
    package{'python-feedparser':
      ensure => installed,
    }
  }
}
