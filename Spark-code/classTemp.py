# -*- coding: utf-8 -*-
from __future__ import print_function
import encodings
import  datetime,gc
import sys ,os 
from time import strftime
import time
from functools import wraps
#----------------------------------------------------------------------------

# to call this class in your code
# from tempmodel import *
# mytempmodel = tempmodel( split=80,data=mydata)
class tempmodel:
#---------------------------------------------------------------------------- 

     def report_time(func):
          '''Decorator reporting the execution time'''
          @wraps(func)
          def wrapper(*args, **kwargs):
               start = time.time()
               result = func(*args, **kwargs)
               end = time.time()
               print(func.__name__, round(end-start,3))
               return result
          return wrapper
#----------------------------------------------------------------------------
     @report_time
     def __init__(this,split,data=None):
         if data != '':
               data = this.getSklearnDefualtData();

         this.data=data
         this.split=split
         this.createmodel()

          

          #------------------------------------------------------------------
          # End of __init__ Function


         
          

#----------------------------------------------------------------------------
     #@report_time
      def getSklearnDefualtData(this):
          this.data=1
          return this.data

#----------------------------------------------------------------------------
     #@report_time
      def createmodel(this):
          model="mymodel"

          this.model=model
          return this.model
          #return this.conn, DataSetName

        
#----------------------------------------------------------------------------
     #@report_time
     def testmodel(this,testdata):
         #this.model.preduct
         value="model return value"
         
         return value


          #return this.conn, LayerName



#----------------------------------------------------------------------------
     @report_time
     def modelReport(this):
         result=0 
         return result
#----------------------------------------------------------------------------
     def Close(this):
         return 0
         #this.destroy
          
