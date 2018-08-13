class base_packages {

	file { "C:\\packages\\MozillaBuildSetup-3.1.exe":
		ensure => present,
		source => 'http://ftp.mozilla.org/pub/mozilla/libraries/win32/MozillaBuildSetup-3.1.exe',
	}
  package { 'mozilla-build':
    ensure          => installed,
    source          => "C:\\packages\\MozillaBuildSetup-3.1.exe",
    install_options => ['/S', '/D=C:\\mozilla-build' ],
  }
}
