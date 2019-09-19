#%spark.pyspark
#------------------import library -------------------
from hdfs3 import HDFileSystem
import pandas as pd
from tabulate import tabulate

#----------------------------------------------------
class DataOperation:
#----------------------------------------------------------------------------
    def __init__(self):
        self.hdfs = self.GetMyhadoop()
#----------------------------------------------------------------------------
    def GetMyhadoop(self):
        host = 'namenode'
        port = 9000
        return HDFileSystem(host, port)
#---------------------------------------------------------------------------- 
    def MyhadoopRead_csv(self, FileName, Encoding):
    
        MyDatafram=0
        with self.hdfs.open(FileName) as f:
            MyDatafram = pd.read_csv(f, encoding=Encoding)
        DataInfo,DataDesc = self.GetDataFrameInfo(MyDatafram)
        
        return MyDatafram,DataInfo,DataDesc
#---------------------------------------------------------------------------- 
    def getPercentage(self,value,total):
        return (value / total * 100).round(2)
    
#----------------------------------------------------------------------------
#   @staticmethod
    def GetDataFrameInfo(self,data):
        desc = data.describe() 
        #-------------------------------------------------------
        DataFelidsType=  data.dtypes.to_frame()
        DataFelidsType.columns = ["ColTypes"]
        DataFelidsType.index.name="ColName"
        #-------------------------------------------------------
        DataIsNullSum= data.isnull().sum().to_frame()
        DataIsNullSum.index.name="ColName"
        DataIsNullSum.columns = ["NullValueCount"]
        #-------------------------------------------------------
        DataNotNullSum= data.notnull().sum().to_frame()
        DataNotNullSum.index.name="ColName"
        DataNotNullSum.columns = ["ValueCount"]
        #-------------------------------------------------------
        DataInfo =DataFelidsType.merge(DataIsNullSum, left_on='ColName', right_on='ColName')
        DataInfo =DataInfo.merge(DataNotNullSum, left_on='ColName', right_on='ColName')
        #-------------------------------------------------------
    
        #-------------------------------------------------------
        DataInfo['NullPercentage'] = self.getPercentage(DataInfo.NullValueCount,data.shape[0])
        DataInfo['NotNullPercentage'] = self.getPercentage(DataInfo.ValueCount,data.shape[0])
        #-------------------------------------------------------
        print("""\
        Load data into three data frames:
        1- First df:  data records
        2- Second df: data info [ ColName, ColTypes, NullValueCount, ValueCount, NullPercentage, NotNullPercentage ]
        3- Third df: data statistics [ count, mean , std, min, max , 25% 50% 75% ]
        """)
        print("\n","records Count: ",data.shape[0],", Columns count:",data.shape[1],"\n -----------------------------------------")
        print("Data Information: \n",tabulate(DataInfo, headers='keys', tablefmt='simple'),"\n -----------------------------------------------------------------")
        print("Data statistics for numbers only: \n",tabulate(desc, headers='keys', tablefmt='simple'),"\n -----------------------------------------------------------------")
        print("First 5 records in data: \n",tabulate(data.head(), headers='keys', tablefmt='simple'),"\n -----------------------------------------------------------------")
        data.info()
        return DataInfo,desc

#----------------------------------------------------------------------------


#----------------------------------------------------------------------------


#----------------------------------------------------------------------------


#----------------------------------------------------------------------------
