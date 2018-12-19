class profiles::common_sys_config {

	include services::disable_service
	include win_defend::disable_windows_defender

	file { "C:\\ronin\\test.txt" :
		ensure  => present,
		content => $facts['location'],
	}
}
