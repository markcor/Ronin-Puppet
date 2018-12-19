class profiles::common_sys_config {
	# Forge modules

	# Custom modules
	include services::disable_service
	include win_defend::disable_windows_defender
	include win_update::disable_windows_update

	# Place to test facts
	file { "C:\\ronin\\test.txt" :
		ensure  => present,
		content => $facts['location'],
	}
}
