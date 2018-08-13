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
		source  => "https://github.com/taskcluster/livelog/releases/download/v1.1.0/livelog-windows-amd64.exe",
	}
# NSSM
	file {"C:\\Windows\\Temp\\NSSMInstall.zip":
		ensure  => present,
		source  => "https://nssm.cc/ci/nssm-2.24-103-gdee49fc.zip",
	}
#TaskCluster proxy
	file { "C:\\generic-worker\\taskcluster-proxy.exe":
		ensure  => present,
		source  => "https://github.com/taskcluster/taskcluster-proxy/releases/download/v4.1.0/taskcluster-proxy-windows-amd64.exe",
	}
#Generic-worker
  file { "C:\\generic-worker\\generic-worker.exe":
    require => File["C:\\packages"],
    ensure  => present,
    source  => "https://github.com/taskcluster/generic-worker/releases/download/v10.11.2/generic-worker-windows-amd64.exe",
  }	
}
