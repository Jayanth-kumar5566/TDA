import pylab
import numpy
import time

def ball(x1,y1,rad):
    #Center of the ball is x,y
    #rad -radius of the ball
    theta = numpy.random.uniform(0,2*numpy.pi,100)
    r = numpy.random.uniform(0,rad,100)

    x=[]
    y=[]

    for i in range(0,len(theta)):
        x.append(x1+r[i]*numpy.cos(theta[i]))
        y.append(y1+r[i]*numpy.sin(theta[i]))

    return (x,y)
for i in range(0,10):   
    b1=ball(100,100,i)
    pylab.plot(b1[0],b1[1],'o')
    file=open("data"+str(i)+".csv",'w')
    file.write('X,Y'+'\n')
    for i in range(0,100): 
        file.write(str(b1[0][i])+','+str(b1[1][i])+'\n')
    file.close()
pylab.show()

'''
file=open("data.csv",'w')
for i in range(0,10000): 
    file.write(str(b1[0][i])+','+str(b1[1][i])+'\n')
    file.write(str(b2[0][i])+','+str(b2[1][i])+'\n')
file.close()
'''
