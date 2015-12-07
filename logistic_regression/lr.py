from sklearn import linear_model
import pandas as pd
import matplotlib.pyplot as plt
data = pd.read_csv('../gps_training_10/task3edges_10.txt', sep=" ", names=["timestamp", "2ndNodeId", "1stNodeId", "aveVelocity"])
clf = linear_model.LinearRegression()
data_segment = data[(data["2ndNodeId"] ==32528267) & (data["1stNodeId"]== 224797838)]
x_predict = [[row[1].tolist()[0]] for row in data_segment.iterrows()]
x_plot = [row[1].tolist()[0] for row in data_segment.iterrows()]
y_plot = [row[1].tolist()[3] for row in data_segment.iterrows()]
clf.fit(x_predict,y_plot)
print clf.coef_
plt.scatter(x_plot, y_plot, alpha=0.3)
plt.plot(x_plot, clf.predict(x_predict), color="red", linewidth=3)
plt.xlabel("time")
plt.ylabel("velocity")
plt.show()
