class python::packages::psycopg2 {
  include python
  package{'python-psycopg2':
    ensure => installed,
  }
}
