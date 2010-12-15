class python::pip26::lxml(
  $virtualenv = undef
) {
  class{'python::pip::lxml':
    virtualenv => $virtualenv,
  }
}
