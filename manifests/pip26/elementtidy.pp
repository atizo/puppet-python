class python::pip26::elementtidy(
  $virtualenv = undef
) {
  class{'python::pip::elementtidy':
    virtualenv => $virtualenv,
  }
}
