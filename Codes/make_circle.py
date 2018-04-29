import kmapper as km
import matplotlib.pyplot as plt

# Some sample data
from sklearn import datasets
import sklearn
data, labels = datasets.make_circles(n_samples=5000, noise=0.03,factor=0.3)

plt.plot(data[:,0],data[:,1],'o')
plt.show()


# Initialize
mapper = km.KeplerMapper(verbose=2)

# Fit to and transform the data
projected_data = mapper.fit_transform(data)
# X-Y axis

# Create dictionary called 'graph' with nodes, edges and
# meta-information
graph = mapper.map(projected_data, data,clusterer=sklearn.cluster.DBSCAN(eps=0.1, min_samples=50),nr_cubes=10,overlap_perc=0.9)

# Visualize it
mapper.visualize(graph,path_html="make_circles_output.html",title="make_circles, samples=5000,clusterer=DBSCAN,filter_fun=sum")
