
module.exports =
  config: require './config'
  services:
    # 'masson/bootstrap/connection':
    #   constraints: tags: 'environment': 'prod'
    'masson/core/system':
      constraints: tags: 'environment': 'prod'
    'masson/core/locale':
      constraints: tags: 'environment': 'prod'
    'masson/core/yum':
      constraints: tags: 'environment': 'prod'
    'masson/core/ssh':
      constraints: tags: 'environment': 'prod'
    'masson/core/sssd':
      constraints: tags: 'environment': 'prod'
    'masson/core/ntp':
      constraints: tags: 'environment': 'prod'
    'masson/core/network':
      constraints: tags: 'environment': 'prod'
    'masson/core/iptables':
      constraints: tags: 'environment': 'prod'
    'masson/core/cgroups':
      constraints: tags: 'environment': 'prod'
    'masson/core/openldap_server':
      constraints: nodes: ['hadoop.ryba']
    'masson/core/krb5_server':
      constraints: nodes: ['hadoop.ryba']
      config:
        krb5:
          etc_krb5_conf:
            realms:
              'HADOOP_SINGLE.RYBA':
                kadmin_principal: 'ryba/admin@HADOOP_SINGLE.RYBA'
                kadmin_password: 'test'
                principals: [
                  principal: 'ryba@HADOOP_SINGLE.RYBA'
                  password: 'test'
                ]
          kdc_conf:
            dbmodules:
              'openldap_hadoop': 
                kdc_master_key: 'test'
    'masson/core/krb5_client': 
      constraints: tags: 'environment': 'prod'
    'masson/commons/postgres/server':
      constraints: nodes: ['hadoop.ryba']
    'masson/commons/mysql/server':
      constraints: nodes: ['hadoop.ryba']
    # 'ryba/hdp': {}
    'ryba/zookeeper/server':
      constraints: tags: 'role': 'master'
    'ryba/zookeeper/client':
      constraints: tags: 'environment': 'prod'
    'ryba/hadoop/core':
      constraints: tags: 'environment': 'prod'
      config:
        realm: 'HADOOP_SINGLE.RYBA'
    'ryba/hadoop/kms':
      constraints: nodes: ['hadoop.ryba']
    'ryba/hadoop/hdfs_dn':
      constraints: nodes: ['hadoop.ryba']
    'ryba/hadoop/hdfs_jn':
      constraints: nodes: ['hadoop.ryba']
    'ryba/hadoop/hdfs_nn':
      constraints: tags: 'role': 'master'
      config:
        nameservice: 'torval'
    'ryba/hadoop/hdfs_client':
      constraints: tags: 'environment': 'prod'
    'ryba/hadoop/httpfs':
      constraints: tags: 'environment': 'prod'
    'ryba/hadoop/yarn_rm':
      constraints: tags: 'role': 'master'
    'ryba/hadoop/yarn_ts':
      constraints: nodes: ['hadoop.ryba']
    'ryba/hadoop/yarn_nm':
      constraints: nodes: ['hadoop.ryba']
    'ryba/hadoop/yarn_client':
      constraints: tags: 'environment': 'prod'
    'ryba/hadoop/mapred_jhs':
      constraints: nodes: ['hadoop.ryba']
    'ryba/hadoop/mapred_client':
      constraints: tags: 'environment': 'prod'
    'ryba/hadoop/hdfs_snn':
      constraints: nodes: ['hadoop.ryba']
    'ryba/tez':
      constraints: tags: 'environment': 'prod'
    'ryba/hbase/master':
      constraints: nodes: ['hadoop.ryba']
    'ryba/hbase/regionserver':
      constraints: nodes: ['hadoop.ryba']
    'ryba/hbase/rest':
      constraints: nodes: ['hadoop.ryba']
    'ryba/hbase/thrift':
      constraints: nodes: ['hadoop.ryba']
    'ryba/hbase/client':
      constraints: tags: 'environment': 'prod'
    'ryba/phoenix/client':
      constraints: tags: 'environment': 'prod'
    'ryba/phoenix/queryserver':
      constraints: nodes: ['hadoop.ryba']
    'ryba/opentsdb':
      constraints: nodes: ['hadoop.ryba']
    'ryba/pig':
      constraints: tags: 'environment': 'prod'
    'ryba/sqoop':
      constraints: tags: 'environment': 'prod'
    'ryba/hive/hcatalog':
      constraints: nodes: ['hadoop.ryba']
    'ryba/hive/server2':
      constraints: nodes: ['hadoop.ryba']
    'ryba/hive/webhcat':
      constraints: nodes: ['hadoop.ryba']
    'ryba/hive/client':
      constraints: tags: 'environment': 'prod'
    'ryba/hive/beeline':
      constraints: tags: 'environment': 'prod'
    'ryba/oozie/server':
      constraints: nodes: ['hadoop.ryba']
    'ryba/oozie/client':
      constraints: tags: 'environment': 'prod'
    'ryba/kafka/broker':
      constraints: nodes: ['hadoop.ryba']
    'ryba/kafka/consumer':
      constraints: tags: 'environment': 'prod'
    'ryba/kafka/producer':
      constraints: tags: 'environment': 'prod'
    # Druid
    # 'ryba/druid/broker':
    #   constraints: tags: 'role': 'master'
    # 'ryba/druid/coordinator':
    #   constraints: tags: 'role': 'worker'
    # 'ryba/druid/overlord':
    #   constraints: tags: 'role': 'worker'
    # 'ryba/druid/historical':
    #   constraints: tags: 'role': 'worker'
    # 'ryba/druid/middlemanager':
    #   constraints: tags: 'role': 'worker'
    # ElasticSearch
    # 'ryba/elasticsearch':
    # Hue
    # 'ryba/huedocker':
    #   constraints: tags: 'role': 'client'
    # Knox
    # 'ryba/knox':
    #   constraints: tags: 'role': 'client'
    # Nifi
    'ryba/nifi':
      constraints: nodes: ['hadoop.ryba']
    # MongoDB
    # 'ryba/mongodb/configsrv':
    #   constraints: tags: 'role': 'master'
    # 'ryba/mongodb/router':
    #   constraints: nodes: ['master2.ryba', 'master3.ryba']
    #   # config:
    #   #   mongo_router_for_configsrv: 'configsrvRepSet1'
    # 'ryba/mongodb/shard':
    #   constraints: tags: 'role': 'worker'
    # 'ryba/elasticsearch':
    #   constraints: tags: 'role': 'worker'
    # 'ryba/atlas':
      # constraints: nodes: ['hadoop.ryba']
    # 'ryba/elasticsearch':
    #   constraints: tags: 'role': 'worker'
    # 'ryba/solr/cloud_docker':
    #   constraints: nodes: ['hadoop.ryba']
    'ryba/huedocker':
      constraints: nodes: ['hadoop.ryba']
    # 'ryba/knox':
    #   constraints: tags: 'role': 'client'
    'ryba/spark/client':
      constraints: tags: 'environment': 'prod'
    # 'ryba/zeppelin':
    #   constraints: tags: 'role': 'client'
  nodes:
    'hadoop.ryba':
      tags:
        'environment': 'prod'
        'role': 'master'
      config:
        ip: '10.10.10.2'
        ryba: ssl:
          'cert': "#{__dirname}/certs/hadoop_cert.pem"
          'key': "#{__dirname}/certs/hadoop_key.pem"
