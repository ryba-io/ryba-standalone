{merge} = require 'masson/lib/misc'

module.exports =
  proxy: null
  yum:
    epel: false
    clean: true
    config: proxy: null
    copy: "#{__dirname}/offline/*.repo"
  curl:
    check: false
    config: noproxy: ['localhost', '127.0.0.1', '.ryba']
  profile:
    'proxy.sh': "" # Created by Vagrant proxy plugin
  ntp:
    servers: ['10.10.10.1']
    fudge: true
  network:
    ifcfg:
      eth0:
        PEERDNS: 'yes' # Prevent dhcp-client to overwrite /etc/resolv.conf
      eth1:
        PEERDNS: 'yes' # Prevent dhcp-client to overwrite /etc/resolv.conf
  hdp:
    hue_smtp_host: ''
  ambari: {}
  ryba:
    hdp_repo: false

