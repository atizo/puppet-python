class python::packages::psycopg2(
  virtualenv = undef
) {
  include python
  if $virtualenv {
    python::pip{'psycopg2':
      virtualenv => $virtualenv,
    }
  } else {
    package{'python-psycopg2':
      ensure => installed,
    }
  }
}
