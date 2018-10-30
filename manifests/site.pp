node default {
	package { 'r10k':  
  		ensure   => installed,
  	provider => puppet_gem,
	}	
	include 'dirs'
	include 'base_packages'
	# include 'management_packages'
	include 'generic_worker'
}
