# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

class win_packages::process_debug {
	defined_classes::pkg::win_zip_pkg { 'proc_expolorer':
		pkg         => 'ProcessExplorer.zip',
		creates     => "C:\\ProcessExplorer\\procexp.exe",
		destination => "C:\\ProcessExplorer",
	}
	defined_classes::pkg::win_zip_pkg { 'proc_monitor':
		pkg         => 'ProcessMonitor.zip',
		creates     => "C:\\ProcessMonitor\\Procmon.exe",
		destination => "C:\\ProcessMonitor",
	}
}

# Bug List
# https://bugzilla.mozilla.org/show_bug.cgi?id=1520042
