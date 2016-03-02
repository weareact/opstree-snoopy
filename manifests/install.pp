class snoopy::install(){
	# Download snoopy installation script
	remote_file { '/tmp/snoopy-install.sh':
		ensure => present,
		source => 'https://github.com/a2o/snoopy/raw/install/doc/install/bin/snoopy-install.sh',
		mode => '755',
	}
	
	# Install Snoopy stable version
	exec {'execute_install_script':
		cwd => '/tmp',
		command => '/tmp/snoopy-install.sh stable',
		creates => '/etc/snoopy.ini',
		require => Remote_file['/tmp/snoopy-install.sh'],
	}
}
