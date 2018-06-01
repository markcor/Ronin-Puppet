class packages::pause_win_update {

	registry_value { 'HKLM\SOFTWARE\Microsoft\Windows\Windows\AU':
  	ensure => present,
  	type   => dword,
  	data   => "0x00000001",
	}
}
