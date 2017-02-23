# /usr/local/bin/node node_modules/ryba/bin/capacity -c ./conf -o ./conf/capacity.coffee -w -p /data/1,/data/2

module.exports = 'nodes': 'hadoop.ryba': 'config': 'ryba':
  'hdfs':
    'nn': 'site': 'dfs.namenode.name.dir': [
      'file:///data/1/hdfs/name'
      'file:///data/2/hdfs/name'
    ]
    'site':
      'dfs.replication': 1
      'dfs.datanode.data.dir': [
        '/data/1/hdfs/data'
        '/data/2/hdfs/data'
      ]
  'yarn':
    'rm': 'site':
      'yarn.scheduler.minimum-allocation-mb': 640
      'yarn.scheduler.maximum-allocation-mb': 2560
      'yarn.scheduler.minimum-allocation-vcores': 1
      'yarn.scheduler.maximum-allocation-vcores': 3
    'capacity_scheduler': 'yarn.scheduler.capacity.resource-calculator': 'org.apache.hadoop.yarn.util.resource.DominantResourceCalculator'
    'site':
      'yarn.nodemanager.resource.percentage-physical-cpu-limit': '100'
      'yarn.nodemanager.resource.memory-mb': 2560
      'yarn.nodemanager.vmem-pmem-ratio': '2.1'
      'yarn.nodemanager.resource.cpu-vcores': 3
      'yarn.nodemanager.local-dirs': [
        '/data/1/yarn/local'
        '/data/2/yarn/local'
      ]
      'yarn.nodemanager.log-dirs': [
        '/data/1/yarn/log'
        '/data/2/yarn/log'
      ]
  'mapred': 'site':
    'yarn.app.mapreduce.am.resource.mb': 320
    'yarn.app.mapreduce.am.command-opts': '-Xmx256m'
    'mapreduce.map.memory.mb': '640'
    'mapreduce.reduce.memory.mb': '1280'
    'mapreduce.map.java.opts': '-Xmx512m'
    'mapreduce.reduce.java.opts': '-Xmx1024m'
    'mapreduce.task.io.sort.mb': '256'
    'mapreduce.map.cpu.vcores': 1
    'mapreduce.reduce.cpu.vcores': 1
  'tez': 'site':
    'tez.am.resource.memory.mb': 320
    'tez.task.resource.memory.mb': '640'
    'tez.runtime.io.sort.mb': '256'
  'hive': 'site':
    'hive.tez.container.size': '640'
    'hive.tez.java.opts': '-Xmx512m'
  'hbase': 'rs': 'heapsize': '1024m'
  'kafka': 'broker': 'log.dirs': [
    '/data/1/kafka'
    '/data/2/kafka'
  ]
  'nifi': 'config': 'properties':
    'nifi.content.repository.directory.cr1': '/data/1/nifi/content_repository'
    'nifi.content.repository.directory.cr2': '/data/2/nifi/content_repository'
    'nifi.provenance.repository.directory.pr1': '/data/1/nifi/provenance_repository'
    'nifi.provenance.repository.directory.pr2': '/data/2/nifi/provenance_repository'

# hadoop.ryba
#   Number of core: 3
#   Number of partitions: 2
#   Memory Total: 4.854 GB
#   Memory System: 1.354 GB
#   HBase RegionServer
#     Memory HBase: 1 GB
#   YARN NodeManager
#     Memory YARN: 2.5 GB
#     Number of Cores: 3
#     Number of Containers: 4
#     Memory per Containers: 640 MB
