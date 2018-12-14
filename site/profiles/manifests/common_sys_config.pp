class profiles::common_sys_config {

	$disbaled_services = ["wsearch", "VSS", "puppet"]

	class disable_service
		disbaled_services => disbaled_services  
}
