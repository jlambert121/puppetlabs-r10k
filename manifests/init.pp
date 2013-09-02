# == Class: r10k
#
# This module installs the r10k package as well as a cron entry to update the
# checked out copies of modules.
#
#
# === Parameters
#
# [*configfile*]
#   String.  Configfile (/etc/r10k.yaml) to install
#   Default: puppet:///modules/r10k/r10k.yaml
#
# [*ensure*]
#   String. Status of the r10k package.
#   Default: present
#
# [*package_provider*]
#   String.  Package provider that should be used to install r10k
#   Default: gem
#
# [*package_name*]
#   String.  Name of the package to install
#   Default: r10k
#
# [*cron_entry*]
#   Boolean.  Whether or not to install the cron entry
#   Default: true
#
# [*cron_frequency*]
#   Integer.  How many times per hour the cron script should run
#   Default: 3
#
# [*cron_user*]
#   String.  User to install the cron job as
#   Default: root
#
#
# === Examples
#
# * Installation:
#     class { 'r10k':
#       configfile  => 'puppet:///data/r10k/r10k.yaml',
#     }
#
#
# === Authors
#
# * Adrien Thebo <mailto:git+github@somethingsinistral.net>
# * Lars Tobias <mailto:larstobi@conduct.no>
# * Justin Lambert <mailto:jlambert@letsevenup.com>
#
#
# === Copyright
#
# FILLMEIN
#
class r10k (
  $configfile       = 'puppet:///modules/r10k/r10k.yaml',
  $ensure           = 'present',
  $package_provider = 'gem',
  $package_name     = 'r10k',
  $cron_entry       = true,
  $cron_frequency   = 3,
  $cron_user        = 'root',
) {

  class { 'r10k::params': }

  class { 'r10k::install':
    ensure            => $ensure,
    package_provider  => $package_provider,
    package_name      => $package_name,
  }

  class { 'r10k::config':
    configfile  => $configfile,
    cron_entry      => $cron_entry,
    cron_frequency  => $cron_frequency,
    cron_user       => $cron_user,
  }

  # Containment
  anchor { 'r10k::begin': } ->
  Class['r10k::params'] ->
  Class['r10k::install'] ->
  Class['r10k::config'] ->
  anchor { 'r10k::end': }

}
