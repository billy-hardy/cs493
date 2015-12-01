drives = load 'gps_training_10/task3cars_10.txt' using PigStorage(' ') as (time:int,id:int, velocity:float, lat:float, lon:float);

drives_lat_long = foreach drives generate time,id,velocity,  FLOOR(lat*100)/100, FLOOR(lon*100)/100;

group_by_car_id = group drives by (id);
group_by_lat_long = group drives_lat_long by (lat, lon);

ave_velocity_for_car = foreach group_by_car_id generate flatten(group), AVG(drives.velocity) as ave_velocity;
ave_velocity_for_lat_long = foreach group_by_lat_long generate flatten(group), AVG(drives.velocity) as ave_velocity;


store ave_velocity_for_car into 'results/cars';
store ave_velocity_for_lat_long into 'results/latLong';
