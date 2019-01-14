# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

class profiles::common_admin {

	# Forge modules

	# Custom modules

	# packages
	shared::win_pkg  { "7zip":
		pkg             => "7z1514-x64.exe",
		install_options => ['/s'],
	}
}

# Bug list

# Main
# https://bugzilla.mozilla.org/show_bug.cgi?id=1510837

# Packages
