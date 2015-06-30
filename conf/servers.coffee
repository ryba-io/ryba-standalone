
module.exports =
  servers:
    'hadoop.ryba':
      ip: '10.10.10.2'
      modules: [
        # 'masson/commons/docker'
        # Commons
        'masson/core/network'
        'masson/core/network_check'
        'masson/core/users'
        'masson/core/ssh'
        'masson/core/ntp'
        'masson/core/proxy'
        'masson/core/yum'
        # Security
        'masson/core/security'
        'masson/core/iptables'
        'masson/core/openldap_server'
        'masson/core/openldap_server/install_tls'
        'masson/core/openldap_server/install_acl'
        'masson/core/openldap_server/install_krb5'
        'masson/core/openldap_client'
        # 'masson/commons/phpldapadmin'
        'masson/core/krb5_server'
        'masson/core/sssd'
        # Hadoop
        'masson/commons/mysql_server'
        'ryba/zookeeper/server'
        'ryba/zookeeper/client'
        'ryba/hadoop/hdfs_dn'
        'ryba/hadoop/hdfs_nn'
        'ryba/hadoop/hdfs_snn' # Check if after nn
        'ryba/hadoop/hdfs_client'
        'ryba/hadoop/mapred_jhs'
        'ryba/hadoop/yarn_ts'
        'ryba/hadoop/yarn_rm'
        'ryba/hadoop/yarn_nm'
        'ryba/hadoop/mapred_client'
        'ryba/tez'
        'ryba/hbase/master'
        'ryba/hbase/regionserver'
        'ryba/hbase/client'
        'ryba/hive/hcatalog'
        'ryba/hive/server2'
        'ryba/hive/webhcat'
        'ryba/hive/client'
        'ryba/oozie/server'
        'ryba/oozie/client'
        'ryba/tools/sqoop'
        'ryba/tools/pig'
        'ryba/tools/flume'
        'ryba/tools/mahout'
        # 'ryba/presto'
        'ryba/falcon'
        'ryba/hue'
        'ryba/ganglia/collector'
        'ryba/ganglia/monitor'
        'ryba/nagios'
      ]
      krb5:
        etc_krb5_conf:
          realms:
            'HADOOP_SINGLE.RYBA':
              kadmin_principal: 'ryba/admin@HADOOP_SINGLE.RYBA'
              kadmin_password: 'test'
              principals: [
                principal: 'ryba@HADOOP_SINGLE.RYBA'
                password: 'test'
              # ,
              #   principal: 'krbtgt/HADOOP.RYBA@USERS.ADALTAS.COM'
              #   password: 'test'
              ]
        kdc_conf:
          dbmodules:
            'openldap_hadoop': 
              kdc_master_key: 'test'
    # 'node1.hadoop':
    #   ip: '172.17.0.19'
    #   connection:
    #     ip: '62.210.88.78'
    #     port: '22001'
    #     bootstrap:
    #       username: 'root'
    #       password: 'hadoop'
    #   run:
    #     install: [
    #       # Commons
    #       'masson/core/network'
    #       'masson/core/users'
    #       'masson/core/ssh'
    #       'masson/core/gcc'
    #       'masson/core/network_check'
    #       'masson/core/ntp'
    #       'masson/core/proxy'
    #       'masson/core/yum'
    #       'masson/core/security'
    #       'masson/core/iptables'
    #       # Security
    #       'masson/core/openldap_server'
    #       'masson/core/openldap_server/install_tls'
    #       'masson/core/openldap_server/install_acl'
    #       'masson/core/openldap_server/install_krb5'
    #       'masson/core/openldap_client'
    #       'masson/commons/phpldapadmin'
    #       'masson/core/krb5_server'
    #       'masson/core/sssd'
    #       # Hadoop
    #       'masson/commons/mysql_server'
    #       'ryba/zookeeper/server'
    #       # 'ryba/hadoop/hdfs_jn'
    #       'ryba/hadoop/hdfs_snn'
    #       'ryba/hadoop/hdfs_nn'
    #       'ryba/hadoop/hdfs_dn'
    #       'ryba/hadoop/yarn_rm'
    #       'ryba/hadoop/yarn_nm'
    #       'ryba/hadoop/mapred_jhs'
    #       'ryba/hbase/master'
    #       'ryba/hbase/regionserver'
    #       'ryba/ganglia/collector'
    #       'ryba/ganglia/monitor'
    #       'ryba/nagios/install'
    #     ]
    #   krb5:
    #     etc_krb5_conf:
    #       # libdefaults:
    #       #   default_realm: 'HADOOP.ADALTAS.COM'
    #       realms:
    #         'HADOOP.ADALTAS.COM':
    #           kadmin_principal: 'wdavidw/admin@HADOOP.ADALTAS.COM'
    #           kadmin_password: 'test'
    #           principals: [
    #             principal: 'wdavidw@HADOOP.ADALTAS.COM'
    #             password: 'test'
    #           ,
    #             principal: 'krbtgt/HADOOP.ADALTAS.COM@USERS.ADALTAS.COM'
    #             password: 'test'
    #           ]
    #     kdc_conf:
    #       dbmodules:
    #         'openldap_node1': 
    #           kdc_master_key: 'ryba123'
    # 'node2.hadoop':
    #   ip: '172.17.0.17'
    #   connection:
    #     ip: '62.210.88.78'
    #     port: '22002'
    #     bootstrap:
    #       username: 'root'
    #       password: 'hadoop'
    #   run:
    #     install: [
    #       # Commons
    #       'masson/core/network'
    #       'masson/core/users'
    #       'masson/core/ssh'
    #       # 'masson/core/gcc'
    #       'masson/core/network_check'
    #       'masson/core/ntp'
    #       'masson/core/proxy'
    #       'masson/core/yum'
    #       'masson/core/security'
    #       'masson/core/iptables'
    #       # Security
    #       'masson/core/openldap_client'
    #       'masson/core/sssd'
    #       # Hadoop
    #       'ryba/zookeeper/server'
    #       'ryba/hadoop/hdfs_jn'
    #       'ryba/hadoop/hdfs_nn'
    #       'ryba/hadoop/yarn_rm'
    #       'ryba/hadoop/mapred_jhs'
    #       'ryba/ganglia/monitor'
    #     ]
    #     status: [
    #       'ryba/zookeeper/server_status'
    #       'ryba/hadoop/hdfs_jn_status'
    #       'ryba/hadoop/hdfs_nn_status'
    #       'ryba/hadoop/yarn_rm_status'
    #       'ryba/hadoop/mapred_jhs_status'
    #     ]
    #     start: [
    #       'ryba/zookeeper/server_start'
    #       'ryba/hadoop/hdfs_jn_start'
    #       'ryba/hadoop/hdfs_nn_start'
    #       'ryba/hadoop/yarn_rm_start'
    #       'ryba/hadoop/mapred_jhs_start'
    #        'ryba/ganglia/monitor_start'
    #     ]
    #     stop: [
    #       'ryba/ganglia/monitor_stop'
    #       'ryba/hadoop/mapred_jhs_stop'
    #       'ryba/hadoop/yarn_rm_stop'
    #       'ryba/hadoop/hdfs_nn_stop'
    #       'ryba/hadoop/hdfs_jn_stop'
    #       'ryba/zookeeper/server_stop'
    #     ]
    #     check: [
    #       'ryba/zookeeper/server_check'
    #       'ryba/hadoop/hdfs_jn_check'
    #     ]
    # 'node3.hadoop':
    #   ip: '172.17.0.18'
    #   connection:
    #     ip: '62.210.88.78'
    #     port: '22002'
    #     bootstrap:
    #       username: 'root'
    #       password: 'hadoop'
    #   run:
    #     install: [
    #       # Commons
    #       'masson/core/network'
    #       'masson/core/users'
    #       'masson/core/ssh'
    #       # 'masson/core/gcc'
    #       'masson/core/network_check'
    #       'masson/core/ntp'
    #       'masson/core/proxy'
    #       'masson/core/yum'
    #       'masson/core/security'
    #       'masson/core/iptables'
    #       # Security
    #       'masson/core/openldap_client'
    #       'masson/core/sssd'
    #       # Hadoop
    #       'ryba/zookeeper/server'
    #       'ryba/hadoop/hdfs_jn'
    #       'ryba/hive/server'
    #       'ryba/hive/webhcat'
    #       'ryba/oozie/server'
    #       'ryba/hue/install'
    #       'ryba/ganglia/monitor'
    #     ]
    #     status: [
    #       'ryba/zookeeper/server_status'
    #       'ryba/hadoop/hdfs_jn_status'
    #     ]
    #     start: [
    #       'ryba/zookeeper/server_start'
    #       'ryba/hadoop/hdfs_jn_start'
    #       'ryba/hive/server_start'
    #       'ryba/hive/webhcat_start'
    #       'ryba/oozie/server_start'
    #       'ryba/hue/start'
    #       'ryba/ganglia/monitor_start'
    #     ]
    #     stop: [
    #       'ryba/ganglia/monitor_stop'
    #       'ryba/hadoop/hdfs_jn_stop'
    #       'ryba/zookeeper/server_stop'
    #       'ryba/hue/stop'
    #       'ryba/oozie/server_stop'
    #       'ryba/hive/webhcat_stop'
    #       'ryba/hive/server_stop'
    #     ]
    #     check: [
    #       'ryba/zookeeper/server_check'
    #       'ryba/hadoop/hdfs_jn_check'
    #       'ryba/hive/webhcat_check'
    #     ]
    # 'group1.adaltas.com':
    #   ip: ''
    #   connection:
    #     ip: '62.210.88.78'
    #     port: '22201'
    #   run:
    #     install: [
    #       'masson/commons/docker'
    #     ]
    # 'group2.adaltas.com':
    #   ip: ''
    #   connection:
    #     ip: '62.210.88.78'
    #     port: '22202'
    #   run:
    #     install: [
    #       'masson/commons/docker'
    #     ]
