from sklearn import linear_model
import pandas as pd
data = pd.read_csv('../gps_training_10/task3edges_10.txt', sep=" ", names=["timestamp", "2ndNodeId", "1stNodeId", "aveVelocity"])
data["timestamp"]
clf = linear_model.LinearRegression()
#clf.fit(data.['timestamp']
