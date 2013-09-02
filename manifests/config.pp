# == Class: r10k
#
# This module installs the r10k config file
#
#
class r10k::config (
  $configfile = 'puppet:///modules/r10k/r10k.yaml',
  $cron_entry       = true,
  $cron_frequency   = 3,
  $cron_user        = 'root',
){

  file { '/etc/r10k.yaml':
    ensure => present,
    owner  => root,
    group  => 0,
    source => $configfile,
  }

  $ensure = $cron_entry ? {
    true    => 'present',
    default => 'absent'
  }

  cron { 'r10k full synchronization':
    ensure  => $ensure,
    user    => $cron_user,
    command => "${r10k::params::r10k_bin} synchronize",
    minute  => interval($cron_frequency, 60),
  }

}
