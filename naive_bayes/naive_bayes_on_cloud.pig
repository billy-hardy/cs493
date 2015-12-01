trace = load 's3://aws-cs440-wbh/data/data400.csv' using PigStorage(',') as (id:int,one:chararray,two:chararray,three:chararray,four:chararray);
three_grouped = group trace by (one,two,three);
four_grouped = group trace by (one,two,three,four);
total_per_attribute = foreach three_grouped generate flatten(group), COUNT(trace) as c;
total_per_class = foreach four_grouped generate flatten(group), COUNT(trace) as c;
joined = join total_per_attribute by (one,two,three), total_per_class by (one,two,three);
probabilities = foreach joined generate $0,$1,$2,$7,(double)$8/$3;
store probabilities into 's3://aws-cs440-wbh/results/attributes400';
class_group = group trace by (four);
total_probabilities = foreach class_group generate flatten(group), (double)COUNT(trace)/396 as prob;
store total_probabilities into 's3://aws-cs440-wbh/results/totals400';


trace = load 's3://aws-cs440-wbh/data/data500.csv' using PigStorage(',') as (id:int,one:chararray,two:chararray,three:chararray,four:chararray);
three_grouped = group trace by (one,two,three);
four_grouped = group trace by (one,two,three,four);
total_per_attribute = foreach three_grouped generate flatten(group), COUNT(trace) as c;
total_per_class = foreach four_grouped generate flatten(group), COUNT(trace) as c;
joined = join total_per_attribute by (one,two,three), total_per_class by (one,two,three);
probabilities = foreach joined generate $0,$1,$2,$7,(double)$8/$3;
store probabilities into 's3://aws-cs440-wbh/results/attributes500';
class_group = group trace by (four);
total_probabilities = foreach class_group generate flatten(group), (double)COUNT(trace)/496 as prob;
store total_probabilities into 's3://aws-cs440-wbh/results/totals500';


trace = load 's3://aws-cs440-wbh/data/data600.csv' using PigStorage(',') as (id:int,one:chararray,two:chararray,three:chararray,four:chararray);
three_grouped = group trace by (one,two,three);
four_grouped = group trace by (one,two,three,four);
total_per_attribute = foreach three_grouped generate flatten(group), COUNT(trace) as c;
total_per_class = foreach four_grouped generate flatten(group), COUNT(trace) as c;
joined = join total_per_attribute by (one,two,three), total_per_class by (one,two,three);
probabilities = foreach joined generate $0,$1,$2,$7,(double)$8/$3;
store probabilities into 's3://aws-cs440-wbh/results/attributes600';
class_group = group trace by (four);
total_probabilities = foreach class_group generate flatten(group), (double)COUNT(trace)/596 as prob;
store total_probabilities into 's3://aws-cs440-wbh/results/totals600';


trace = load 's3://aws-cs440-wbh/data/data10000.csv' using PigStorage(',') as (id:int,one:chararray,two:chararray,three:chararray,four:chararray);
three_grouped = group trace by (one,two,three);
four_grouped = group trace by (one,two,three,four);
total_per_attribute = foreach three_grouped generate flatten(group), COUNT(trace) as c;
total_per_class = foreach four_grouped generate flatten(group), COUNT(trace) as c;
joined = join total_per_attribute by (one,two,three), total_per_class by (one,two,three);
probabilities = foreach joined generate $0,$1,$2,$7,(double)$8/$3;
store probabilities into 's3://aws-cs440-wbh/results/attributes10000';
class_group = group trace by (four);
total_probabilities = foreach class_group generate flatten(group), (double)COUNT(trace)/9996 as prob;
store total_probabilities into 's3://aws-cs440-wbh/results/totals10000';