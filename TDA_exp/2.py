import matplotlib.pyplot as plt
import numpy



for e in numpy.arange(0,20,2):
    #e=2
    c=10
    y1=numpy.random.uniform(c,c+e,1000)
    file=open("data"+str(e)+".csv",'w')
    for i in range(0,1000):
        file.write(str(i)+','+str(y1[i])+'\n')
    file.close()
    
