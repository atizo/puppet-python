class python::packages::multiprocessing {
  include python
  python::pip{'multiprocessing':
    ensure => installed,
  }
}
