# == Class: snoopy
#
# Snoopy module installs and configures snoopy and its logs
#
# === Variables
# username: Either true/false, If you want to get username in snoopy logs
# userid: Either true/false, If you want to get user id in snoopy logs
# groupid: Either true/false, If you want to get groupid in snoopy logs
# superid: Either true/false, If you want to get superuser id in snoopy logs
# terminal: Either true/false, If you want to get terminal name in snoopy logs
# current_directory: Either true/false, If you want to get the directory from where command is issued in snoopy logs
# processid: Either true/false, If you want to get the processid of the command issued in snoopy logs
# filename: Either true/false, If you want to get the path of the binary which is executed in snoopy logs
# logfile: Either true/false, If you want to specify wheteher logs should be generated in a user defined log file
# log_path: Either true/false, Path of the log file where snoopy logs will be genrated, only applicable when logfile is set to true
# datetime: Either true/false, If you want to get datetime at which command is executed
# === Examples
#
#  class { 'snoopy':}
#
# === Authors
#
# Author Name <connect@opstree.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class snoopy (
  $current_directory = $::snoopy::params::current_directory,
  $datetime          = $::snoopy::params::datetime,
  $filename          = $::snoopy::params::filename,
  $filter_chain      = $::snoopy::params::filter_chain,
  $groupid           = $::snoopy::params::groupid,
  $install_method    = $::snoopy::params::install_method,
  $logfile           = $::snoopy::params::logfile,
  $log_path          = $::snoopy::params::log_path,
  $message_format    = $::snoopy::params::message_format,
  $processid         = $::snoopy::params::processid,
  $superid           = $::snoopy::params::superid,
  $terminal          = $::snoopy::params::terminal,
  $username          = $::snoopy::params::username,
  $userid            = $::snoopy::params::userid,
) inherits snoopy::params {
  # Install snoopy
  class {'snoopy::install':}

  # Configure snoopy logs
  class {'snoopy::configure':
    username          => $username,
    userid            => $userid,
    groupid           => $groupid,
    superid           => $superid,
    terminal          => $terminal,
    current_directory => $current_directory,
    processid         => $processid,
    filename          => $filename,
    logfile           => $logfile,
    log_path          => $log_path,
    datetime          => $datetime,
    filter_chain      => $filter_chain,
    message_format    => $message_format,
    require           => Class['snoopy::install'],
  }
}
# vi:syntax=puppet:filetype=puppet:ts=4:et:
