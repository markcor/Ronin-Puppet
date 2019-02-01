# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

class win_defend::disable_windows_defender {

	service { 'WinDefend' :
		ensure => 'stopped',
		enable => 'false',
	}

	registry::value { 'DisableConfig' :	
		key  => 'HKLM\SOFTWARE\Policies\Microsoft\Windows Defender',
		type => dword,
		data => '1',
	}
	registry::value { 'DisableAntiSpyware' :
		key  => 'HKLM\SOFTWARE\Policies\Microsoft\Windows Defender',
		type => dword,
		data => '1',
	}
}
