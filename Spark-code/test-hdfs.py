%spark.pyspark

from pyspark import SparkConf, SparkContext

sc.stop()

conf = SparkConf().setAppName('testappx23').setMaster('spark://e280bfb76255:7077')

sc = SparkContext(conf=conf).getOrCreate()
 

content = sc.textFile("hdfs://namenode:9000/hdfs_test")

content.collect()