puppet-r10k
===========

Install and manage r10k, the killer robot powered puppet deployment tool

Synopsis
--------

    # Install the r10k gem and your site specific r10k configfile
    class { 'r10k':
      configfile => 'puppet:///modules/service/puppet/master/r10k.yaml',
    }

    # By default a cron job will be installed to root's crontab which will
    update the environment every 20 minutes.  This can be configured through
    the r10k class parameters.

Requirements
------------

Currently this is only implemented for Debian squeeze. Pull requests gladly accepted!

This also requires the puppetlabs-operations `interval` function and puppetlabs stdlib module.
