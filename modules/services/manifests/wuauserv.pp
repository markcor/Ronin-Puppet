class packages::wuauserv {

	service { 'wuauserv':
		ensure => 'stopped',
	}
}
