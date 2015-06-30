
module.exports =
  security:
    selinux: false
    limits: {}
  network:
    hosts_auto: true
    hosts:
      '127.0.0.1': 'localhost localhost.localdomain localhost4 localhost4.localdomain4'
      # '10.10.10.10': 'repos.ryba ryba'
    # resolv: """
    #   search ryba
    #   nameserver 10.0.2.3
    #   """
  iptables:
    action: 'stop'
    startup: false
    log: true
    rules: [
      # { chain: 'INPUT', jump: 'ACCEPT', source: "10.10.10.0/24", comment: 'Local Network' }
    ]
  ssh:
    banner:
      destination: '/etc/banner'
      content: "Welcome to Hadoop!"
    sshd_config:
      PermitRootLogin: 'without-password'
  users:
    'root':
      authorized_keys:  []
  yum:
    packages: "tree": true, "git": true, "htop": true
  mysql:
    server:
      current_password: ''
      password: 'test123'
      my_cnf: mysqld: innodb_file_per_table: '1'
  openldap_server:
    suffix: 'dc=ryba'
    root_dn: 'cn=Manager,dc=ryba'
    root_password: 'test'
    config_dn: 'cn=admin,cn=config'
    config_password: 'test'
    users_dn: 'ou=users,dc=ryba'
    groups_dn: 'ou=groups,dc=ryba'
    ldapdelete: []
    ldapadd: []
    tls: true
    tls_ca_cert_file: "#{__dirname}/certs/cacert.pem"
    tls_cert_file: "#{__dirname}/certs/hadoop_cert.pem"
    tls_key_file: "#{__dirname}/certs/hadoop_key.pem"
  openldap_client:
    certificates: [
      "#{__dirname}/certs/hadoop_cert.pem"
    ]
  openldap_server_krb5:
    manager_dn: 'cn=Manager,dc=ryba' # Manager must have write access to "kerberos_dn"
    manager_password: 'test'
    # kerberos_dn: 'ou=kerberos,dc=ryba'
    # groups_dn: 'cn=krbadmin,ou=groups,dc=ryba'
    # users_dn: 'cn=krbadmin,ou=users,dc=ryba'
    krbadmin_user:
      mail: 'david@adaltas.com'
      userPassword: 'test' #test
  krb5:
    etc_krb5_conf:
      libdefaults:
        default_realm: 'HADOOP_SINGLE.RYBA'
      realms:
        'HADOOP_SINGLE.RYBA':
          default_domain: 'ryba'
      domain_realm:
        # '.ryba': 'HADOOP_SINGLE.RYBA'
        'ryba': 'HADOOP_SINGLE.RYBA'
  sssd:
    # test_user: 'ryba'
    force_check: false
    certificates: [
      "#{__dirname}/certs/cacert.pem"
    ]
    config:
      'domain/hadoop':
        'cache_credentials' : 'True'
        'ldap_search_base' : 'ou=users,dc=ryba'
        'ldap_group_search_base' : 'ou=groups,dc=ryba'
        'id_provider' : 'ldap'
        'auth_provider' : 'ldap'
        'chpass_provider' : 'ldap'
        'ldap_uri' : 'ldaps://hadoop.ryba:636'
        'ldap_tls_cacertdir' : '/etc/openldap/cacerts'
        'ldap_default_bind_dn' : 'cn=Manager,dc=ryba'
        'ldap_default_authtok' : 'test'
        'ldap_id_use_start_tls' : 'True'
      'sssd':
        'domains' : 'hadoop'
  java: {}
    # java_home: '/usr/java/default'
    # jdk:
    #   version: '1.7.0_60'
    #   location: "#{__dirname}/../shared/java/jdk-7u60-linux-x64.tar.gz"
    # jce_local_policy: "#{__dirname}/../shared/java/jce_policy-7/local_policy.jar"
    # jce_us_export_policy: "#{__dirname}/../shared/java/jce_policy-7/US_export_policy.jar"
  ryba:
    clean_logs: true
    force_check: false
    # static_host: false
    security: 'kerberos'
    realm: 'HADOOP_SINGLE.RYBA'
    nameservice: 'torval'
    krb5_user: password: 'test123' # User used for testing
    ssl:
      'cacert': "#{__dirname}/certs/cacert.pem"
      'cert': "#{__dirname}/certs/hadoop_cert.pem"
      'key': "#{__dirname}/certs/hadoop_key.pem"
    hadoop_opts: '-Djava.net.preferIPv4Stack=true -Dsun.security.krb5.debug=false'
    core_site:
      'hadoop.proxyuser.hcat.groups': '*'
      'hadoop.proxyuser.hcat.hosts': '*'
      'hadoop.proxyuser.hue.hosts': '*'
      'hadoop.proxyuser.hue.groups': '*'
      'hadoop.proxyuser.flume.groups': '*'
      'hadoop.proxyuser.flume.hosts': '*'
      'hadoop.security.auth_to_local': """
      
            RULE:[2:$1@$0]([rn]m@.*)s/.*/yarn/
            RULE:[2:$1@$0](ats@.*)s/.*/yarn/
            RULE:[2:$1@$0](jhs@.*)s/.*/mapred/
            RULE:[2:$1@$0]([nd]n@.*)s/.*/hdfs/
            RULE:[2:$1@$0](hm@.*)s/.*/hbase/
            RULE:[2:$1@$0](rs@.*)s/.*/hbase/
            RULE:[1:$1@$0](^.*@HADOOP\\.ADALTAS\\.COM$)s/^(.*)@HADOOP\\.ADALTAS\\.COM$/$1/g
            RULE:[2:$1@$0](^.*@HADOOP\\.ADALTAS\\.COM$)s/^(.*)@HADOOP\\.ADALTAS\\.COM$/$1/g
            DEFAULT

      """
    hadoop_heap: '512'
    hadoop_namenode_init_heap: '-Xms512m'
    hdfs:
      krb5_user: password: 'hdfs123'
      sysctl:
        'vm.swappiness': 0 # Default to 60
        'vm.overcommit_memory': 1 # Default to 0
        'vm.overcommit_ratio': 100 # Default to 50
        'net.core.somaxconn': 1024 # Default to 128
      site:
        'dfs.namenode.safemode.extension': 1000 # "1s", default to "30s"
    ssh_fencing:
      private_key: "#{__dirname}/hdfs_keys/id_rsa"
      public_key: "#{__dirname}/hdfs_keys/id_rsa.pub"
    zkfc_password: 'hdfs123'
    yarn:
      opts: '-Dsun.net.spi.nameservice.provider.1=sun,dns' # HADOOP_JAAS_DEBUG=true
      site: {}
        # 'yarn.nodemanager.local-dirs': ['/data/1/yarn/local', '/data/2/yarn/local', '/data/3/yarn/local', '/data/4/yarn/local']
        # 'yarn.nodemanager.log-dirs': ['/data/1/yarn/logs', '/data/2/yarn/logs', '/data/3/yarn/logs', '/data/4/yarn/logs']
        # 'yarn.scheduler.maximum-allocation-mb': '1800' # Should not exceed vm memory or no worker will be able to get a container
        # 'yarn.scheduler.minimum-allocation-mb': '1000' # Avoid "$host doesn't satisfy minimum allocations" with small vms
    capacity_scheduler:
      'yarn.scheduler.capacity.maximum-am-resource-percent': '.5'
    mapred:
      site:
        'mapreduce.job.counters.max': '10000'
        'mapreduce.job.counters.limit': '10000'
    hive:
      site:
        'javax.jdo.option.ConnectionDriverName': 'com.mysql.jdbc.Driver'
        'javax.jdo.option.ConnectionUserName': 'hive'
        'javax.jdo.option.ConnectionPassword': 'hive123'
    oozie:
      site:
        'oozie.service.ProxyUserService.proxyuser.hue.hosts': '*'
        'oozie.service.ProxyUserService.proxyuser.hue.groups': '*'
    hue:
      ini:
        desktop:
          smtp: host: ''
          database:
            engine: 'mysql'
            password: 'hue123'
      ssl:
        certificate: "#{__dirname}/certs/hadoop_cert.pem"
        private_key: "#{__dirname}/certs/hadoop_key.pem"
        client_ca: "#{__dirname}/certs/cacert.pem"
    sqoop: libs: []
    hbase:
      # master_opts: '-Xms512m -Xmx512m'
      admin:
        password: 'hbase123'
    nagios:
      users:
        nagiosadmin:
          password: 'nagios123'
          alias: 'Nagios Admin'
          email: ''
        guest:
          password: 'guest123'
          alias: 'Nagios Guest'
          email: ''
      groups:
        admins:
          alias: 'Nagios Administrators'
          members: ['nagiosadmin','guest']
      azkaban:
        web_server: 'https://s3.amazonaws.com/azkaban2/azkaban2/2.5.0/azkaban-web-server-2.5.0.tar.gz'
        executor_server: 'https://s3.amazonaws.com/azkaban2/azkaban2/2.5.0/azkaban-executor-server-2.5.0.tar.gz'
        mysql_scripts: 'https://s3.amazonaws.com/azkaban2/azkaban2/2.5.0/azkaban-sql-script-2.5.0.tar.gz'
        hdfs_browser: 'https://s3.amazonaws.com/azkaban2/azkaban-plugins/2.5.0/azkaban-hdfs-viewer-2.5.0.tar.gz'
        jobtype: 'https://s3.amazonaws.com/azkaban2/azkaban-plugins/2.5.0/azkaban-jobtype-2.5.0.tar.gz'
        hadoop_security_manager: 'https://s3.amazonaws.com/azkaban2/azkaban-plugins/2.5.0/azkaban-hadoopsecuritymanager-2.5.0.tar.gz'
        job_summary: 'https://s3.amazonaws.com/azkaban2/azkaban-plugins/2.5.0/azkaban-jobsummary-2.5.0.tar.gz'
        pig_visualizer: 'https://s3.amazonaws.com/azkaban2/azkaban-plugins/2.5.0/azkaban-pigvisualizer-2.5.0.tar.gz'
        reportal: 'https://s3.amazonaws.com/azkaban2/azkaban-plugins/2.5.0/azkaban-reportal-2.5.0.tar.gz'







