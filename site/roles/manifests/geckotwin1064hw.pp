# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/

class roles::geckotwin1064hw  {

	# System Configuration
	include profiles::common_sys_config
	include profiles::hardware_common_sys_config

	# Admin Configuration
	include profiles::common_admin
}
