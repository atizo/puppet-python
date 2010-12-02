class python::packages::psycopg2 {
  include python
  include postgres::devel
  python::pip26{'psycopg2':
    ensure => installed,
  }
}
