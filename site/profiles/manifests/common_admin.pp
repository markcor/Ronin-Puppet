# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

class profiles::common_admin {

	# Forge modules

	# Custom modules

	# packages

	shared::win_pkg  { "7zip":
		pkg             => "7z1806-x64.msi",
		install_options => ['/quiet'],
	}
	shared::win_zip_pkg { 'proc_monitor':
		pkg         => 'ProcessMonitor.zip',
		creates     => "C:\\ProcessExplorer",
	}
}

# Bug list

# Main
# https://bugzilla.mozilla.org/show_bug.cgi?id=1510837

# Packages
# 7zip
# https://bugzilla.mozilla.org/show_bug.cgi?id=1519249
