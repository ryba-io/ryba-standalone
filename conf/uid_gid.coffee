
module.exports =
  bind_server:
    user: uid: 802, gid: 802
    group: gid: 802
  openldap_server:
    proxy_user:
      uidNumber: 801
      gidNumber: 801
    proxy_group:
      gidNumber: 801
  openldap_server_krb5:
    krbadmin_user:
      uidNumber: 800
      gidNumber: 800
    krbadmin_group:
      gidNumber: 800
  httpd:
    user: uid: 2416, gid: 2416
    group: gid: 2416
  ryba:
    hadoop_group: gid: 2400
    group: gid: 2414
    user: uid: 2414, gid: 2414
    zookeeper:
      group: gid: 2402
      uid: 2402, gid: 2400
    hdfs:
      group: gid: 2401
      user: uid: 2401, gid: 2401
    yarn:
      group: gid: 2403
      user: uid: 2403, gid: 2403
    mapred:
      group: gid: 2404
      user: uid: 2404, gid: 2404
    flume:
      group: gid: 2405
      user: uid: 2405, gid: 2405
    hive:
      group: gid: 2407
      user: uid: 2407, gid: 2407
    hue:
      group: gid: 2410
      user: uid: 2410, gid: 2410
    # webhcat:
    #   group: gid: 2407
    #   user: uid: 2407, gid: 2407
    hbase:
      group: gid: 2409
      user: uid: 2409, gid: 2409
    oozie:
      group: gid: 2411
      user: uid: 2411, gid: 2411
    sqoop:
      user: uid: 2412, gid: 2400
    pig:
      user: uid: 2413, gid: 2400
    ganglia:
      rrdcached_group: gid: 2406
      rrdcached_user: uid: 2406, gid: 2406
    falcon:
      group: gid: 2421
      user: uid: 2421, gid: 2421
    nagios:
      group: gid: 2418
      groupcmd: gid: 2419
      user: uid: 2418, gid: 2418
    knox:
      group: gid: 2420
      user: uid: 2420, gid: 2420
  xasecure:
    group: gid: 2417
    user: uid: 2417, gid: 2417
  