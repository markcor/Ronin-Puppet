class base_packages {

  package { 'mozilla-build':
    ensure          => 'installed',
    source          => 'http://ftp.mozilla.org/pub/mozilla/libraries/win32/MozillaBuildSetup-3.1.exe',
    install_options => ['/S', '/D=C:\\mozilla-build' ]
  }
}
