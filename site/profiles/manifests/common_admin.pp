# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

class profiles::common_admin {

	# Forge modules

	# Custom modules

	# packages
	file { "C:\\Windows\\System32\\jq.exe":
		ensure => present,
		source => "https://s3.amazonaws.com/windows-opencloudconfig-packages/RoninPackages/jq-win64.exe",
	}
	shared::pkg::win_msi_pkg  { "7-Zip 18.06 (x64 edition)":
		pkg             => "7z1806-x64.msi",
		install_options => ['/quiet'],
	}
	shared::pkg::win_zip_pkg { 'proc_expolorer':
		pkg         => 'ProcessExplorer.zip',
		creates     => "C:\\ProcessExplorer.zip\\procexp.exe",
		destination => "C:\\ProcessExplorer",
	}
	shared::pkg::win_zip_pkg { 'proc_monitor':
		pkg         => 'ProcessMonitor.zip',
		creates     => "C:\\ProcessMonitor\\Procmon.exe",
		destination => "C:\\ProcessMonitor",
	}
    shared::pkg::win_exe_pkg  { "gpg4win-2.3.0":
        pkg             => "gpg4win-2.3.0.exe",
        install_options_string => "/S",
    }
    shared::pkg::win_exe_pkg  { "sublime_text":
        pkg             => "SublimeTextBuild3176x64Setup.exe",
        install_options_string => "/VERYSILENT /NORESTART /TASKS=\"contextentry\"",
    }
}

# Bug list

# Main
# https://bugzilla.mozilla.org/show_bug.cgi?id=1510837

# Packages
# 7zip
# https://bugzilla.mozilla.org/show_bug.cgi?id=1519249i
# Proc explorer/monitor
# https://bugzilla.mozilla.org/show_bug.cgi?id=1520042
