class python::packages::feedparser {
  include python
  package{'python-feedparser':
    ensure => installed,
  }
}
