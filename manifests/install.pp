class snoopy::install(
  $install_method = $snoopy::install_method,
  $package_ensure = $snoopy::package_ensure,
  $package_name   = $snoopy::package_name,
){

  case $install_method {
    'script': {
      # Download snoopy installation script
      remote_file { '/tmp/snoopy-install.sh':
        ensure => present,
        source => 'https://github.com/a2o/snoopy/raw/install/doc/install/bin/snoopy-install.sh',
        mode   => '0755',
      }

      # Install Snoopy stable version
      exec {'execute_install_script':
        cwd     => '/tmp',
        command => '/tmp/snoopy-install.sh stable',
        creates => '/etc/snoopy.ini',
        require => Remote_file['/tmp/snoopy-install.sh'],
      }
    }
    'package': {
      package { $package_name:
        ensure => $package_ensure
      }

    }
    default: { fail("Install method ${install_method} is not currently supported") }
  }

}
# vi:syntax=puppet:filetype=puppet:ts=4:et:
