import matplotlib.pyplot as plt
import numpy


for d in numpy.arange(0,20,2):
    e=2
    #d=15
    c=10
    y1=numpy.random.uniform(c,c+e,100)
    y2=numpy.random.uniform(c+d,c+d+e,100)
    file=open("data"+str(d)+".csv",'w')
    n=0
    file.write('X,Y'+'\n')
    for i in range(0,100):
        file.write(str(n)+','+str(y1[i])+'\n')
        file.write(str(n+1)+','+str(y2[i])+'\n')
        n=n+2    
    file.close()
    
