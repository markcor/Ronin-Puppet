class base_packages {

	include dirs

	file { "C:\\packages\\MozillaBuildSetup-3.1.exe":
		require => File["C:\\packages"],
		ensure  => present,
		source  => 'http://ftp.mozilla.org/pub/mozilla/libraries/win32/MozillaBuildSetup-3.1.exe',
	}
  package { 'mozilla-build':
    ensure          => installed,
    source          => "C:\\packages\\MozillaBuildSetup-3.1.exe",
    install_options => ['/S', '/D=C:\\mozilla-build' ],
  }
}
