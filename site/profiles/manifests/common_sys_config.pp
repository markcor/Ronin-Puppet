class profiles::common_sys_config {

	$disbaled_services = ["wsearch", "VSS", "puppet"]

	class { 'services_disable_service':
		disbaled_services => disbaled_services
	}
}
