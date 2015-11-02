drives = load 'gps_training_10/task3cars_10.txt' using PigStorage(' ') as (time:int,id:int, velocity:float, lat:float, long:float);

group_by_car_id = group drives by (id);
group_by_lat_long = group drives by (lat, long);

ave_velocity_for_car = foreach group_by_car_id generate flatten(group), AVERAGE(drives.velocity) as ave_velocity;
ave_velocity_for_lat_long = foreach group_by_lat_long generate flatten(group), AVERAGE(drives.velocity) as ave_velocity;

%========
joined = join total_per_attribute by (one,two,three), total_per_class by (one,two,three);
probabilities = foreach joined generate $0,$1,$2,$7,(double)$8/$3;

store probabilities into 'results/attributes';


class_group = group trace by (four);
total_probabilities = foreach class_group generate flatten(group), (double)COUNT(trace)/596 as prob;

store total_probabilities into 'results/totals';


