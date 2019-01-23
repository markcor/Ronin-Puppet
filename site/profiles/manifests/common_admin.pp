# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

class profiles::common_admin {

	# Forge modules

	# Custom modules
	$programfilesx86 = $facts['programfilesx86']

	# packages
	file { "C:\\Windows\\System32\\jq.exe":
		ensure => present,
		source => "https://s3.amazonaws.com/windows-opencloudconfig-packages/RoninPackages/jq-win64.exe",
	}
	defined_classes::pkg::win_msi_pkg  { "7-Zip 18.06 (x64 edition)":
		pkg             => "7z1806-x64.msi",
		install_options => ['/quiet'],
	}
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
    defined_classes::pkg::win_exe_pkg  { "gpg4win-2.3.0":
        pkg             => "gpg4win-2.3.0.exe",
        install_options_string => "/S",
    }
    defined_classes::pkg::win_exe_pkg  { "sublime_text":
        pkg             => "SublimeTextBuild3176x64Setup.exe",
        install_options_string => "/VERYSILENT /NORESTART /TASKS=\"contextentry\"",
    }

	# Nxlog and configuration
    defined_classes::pkg::win_msi_pkg  { "NxLog-CE":
        pkg             => "nxlog-ce-2.8.1248.msi",
        install_options => ['/quiet'],
    }
	defined_classes::files::config_file { "papertrail-bundle":
		file        => "papertrail-bundle.pem",
		target_dir  => "$programfilesx86\\nxlog\\cert",
		application => "nxlog",
	}
    }
    defined_classes::files::config_template { "nxlog.conf":
		template    => "nxlog.conf.epp",
        target_dir  => "$programfilesx86\\nxlog\\confi\\nxlog.conf",
        application => "nxlog",
    }
   # file { "$programfilesx86\\nxlog\\conf\\nxlog.conf":
   #     source => epp("$site_source/profiles/templates/common_admin/nxlog.conf.epp"),
   # }
}	

# Bug list

# Main
# https://bugzilla.mozilla.org/show_bug.cgi?id=1510837

# Packages
# 7zip
# https://bugzilla.mozilla.org/show_bug.cgi?id=1519249i
# Proc explorer/monitor
# https://bugzilla.mozilla.org/show_bug.cgi?id=1520042
