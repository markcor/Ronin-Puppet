class profiles::common_sys_config {
	# Forge modules
	include ::windowstime

	# Custom modules
	include services::disable_service
	include win_update::disable_windows_update

	file { "C:\\ronin\\test.txt" :
		ensure  => present,
		content => $facts['location'],
	}
}
