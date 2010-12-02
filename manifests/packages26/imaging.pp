class python::packages::imaging {
  include python
  python::pip26{'pil':
    ensure => installed,
  }
}
