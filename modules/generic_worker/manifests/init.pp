class generic_worker {

# This class includes genric-worker,the configuration, and supporting applications  

# This class includes
# 	Livelog
#		TaskCluster proxy
#		NSSM
#		Generic-worker 

	include dirs

# Livelog
	file { "C:\\generic-worker\\livelog.exe": 
		require => File["C:\\generic-worker"],
		ensure  => present,
		source  => "https://s3.amazonaws.com/windows-opencloudconfig-packages/RoninPackages/livelog-windows-amd64.exe",
	}
# NSSM
	file {"C:\\Windows\\Temp\\NSSMInstall.zip":
		ensure  => present,
		source  => "https://nssm.cc/ci/nssm-2.24-103-gdee49fc.zip",
	}
	windows::unzip { "C:\\Windows\\Temp\\NSSMInstall.zip":
		destination => "C:\\Windows\\Temp",
		creates     => "C:\\Windows\\Temp\\NSSMInstall.zip",
}
#TaskCluster proxy
	file { "C:\\generic-worker\\taskcluster-proxy.exe":
		ensure  => present,
		source  => "https://s3.amazonaws.com/windows-opencloudconfig-packages/RoninPackages/taskcluster-proxy-windows-amd64.exe",
	}
#Generic-worker
  file { "C:\\generic-worker\\generic-worker.exe":
    require => File["C:\\packages"],
    ensure  => present,
    source  => "https://s3.amazonaws.com/windows-opencloudconfig-packages/RoninPackages/generic-worker-windows-amd64.exe",
  }	
}
