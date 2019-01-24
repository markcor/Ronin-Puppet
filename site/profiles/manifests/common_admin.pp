# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

class profiles::common_admin {

	# Forge modules

	# Custom modules

	include win_packages::jq
	include win_packages::gpg4win
	include win_packages::nxlog
	include win_packages::process_debug
	include win_packages::sevenzip
	include win_packages::sublimetxt

}	

# Bug list

# Main
# https://bugzilla.mozilla.org/show_bug.cgi?id=1510837
