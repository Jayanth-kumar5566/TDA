import kmapper as km
import matplotlib.pyplot as plt
import pandas

# Some sample data
import sklearn
import numpy

df=pandas.read_csv("data_reshaped.csv")
data=df[["GSH","HbA1c"]].as_matrix()
labels=df["Patient Status"].as_matrix()

#===========Standardization==============
data[:,0]=(data[:,0]-numpy.mean(data[:,0]))/numpy.std(data[:,0])
data[:,1]=(data[:,1]-numpy.mean(data[:,1]))/numpy.std(data[:,1])
#===========================================
'''
plt.plot(data[:,0],data[:,1],'o')
plt.show()
'''

# Initialize
mapper = km.KeplerMapper(verbose=2)

# Fit to and transform the data
projected_data = mapper.fit_transform(data,projection='sum',scaler=None)
# X-Y axis

# Create dictionary called 'graph' with nodes, edges and
# meta-information
graph = mapper.map(projected_data,data,nr_cubes=5,overlap_perc=0.5,clusterer=sklearn.cluster.KMeans(n_clusters=3))

# Visualize it
mapper.visualize(graph,path_html="data_output.html",title="clusterer=KMeans,filter_fun=sum",custom_tooltips=labels)
