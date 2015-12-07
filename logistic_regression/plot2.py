from sklearn.preprocessing import PolynomialFeatures
from sklearn.pipeline import make_pipeline
from sklearn.linear_model import Ridge
from sklearn.linear_model import Lasso
from sklearn.linear_model import BayesianRidge
from sklearn import svm
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
data = pd.read_csv('../gps_training_10/task3edges_10.txt', sep=" ", names=["timestamp", "2ndNodeId", "1stNodeId", "aveVelocity"])
poly = PolynomialFeatures(degree=5)


data_segment = data[(data["2ndNodeId"] ==32528267) & (data["1stNodeId"]== 224797838)]
x_predict = [[row[1].tolist()[0]] for row in data_segment.iterrows()]
x_plot = [row[1].tolist()[0] for row in data_segment.iterrows()]
y_plot = [row[1].tolist()[3] for row in data_segment.iterrows()]
x_test= x_predict[-20:]
y_test= y_plot[-20:]

plt.scatter(x_plot, y_plot, alpha=0.3)

model = make_pipeline(PolynomialFeatures(degree=10),Ridge())
model.fit(x_predict, y_plot)
ridge = plt.plot(x_plot, model.predict(x_predict), color="red", linewidth=3, label="Ridge")
print "Ridge: ",row[1]["2ndNodeId"], row[1]["1stNodeId"],  "MSE: ",np.mean((model.predict(x_test)-y_test)**2)
model = make_pipeline(PolynomialFeatures(degree=10), Lasso(alpha=0.1))
model.fit(x_predict, y_plot)
lasso = plt.plot(x_plot, model.predict(x_predict), color="green", linewidth=3, label="Lasso")
print "Lasso: ",row[1]["2ndNodeId"], row[1]["1stNodeId"],  "MSE: ",np.mean((model.predict(x_test)-y_test)**2)
model = make_pipeline(PolynomialFeatures(degree=10), svm.SVR())
model.fit(x_predict, y_plot)
print "SVR: ",row[1]["2ndNodeId"], row[1]["1stNodeId"],  "MSE: ",np.mean((model.predict(x_test)-y_test)**2)
svr = plt.plot(x_plot, model.predict(x_predict), color="orange", linewidth=3, label="SVR")
plt.xlabel("time")
plt.ylabel("velocity")

plt.legend(bbox_to_anchor=(0.75, 0.25), loc=2, borderaxespad=0.)
#plt.legend([ridge, lasso, svr], ["Ridge", "Lasso", "SVR"])
#plt.legend([ridge, lasso, svr])
#plt.show()
from matplotlib.backends.backend_pdf import PdfPages
pp = PdfPages('regressions.pdf')
plt.savefig(pp, format="pdf")
pp.close()
