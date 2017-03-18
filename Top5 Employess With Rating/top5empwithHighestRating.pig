EMPLOYEE = load '/home/acadgild/Downloads/employee_details.txt' using PigStorage(',') 
as (id:int,name:chararray,salary:long,rank:int);

EMPLOYEEORDER = ORDER EMPLOYEE by rank desc,name asc;

EMPLOYEEFILTER = limit EMPLOYEEORDER 5;

store EMPLOYEEFILTER into '/home/acadgild/Downloads/HighestRating';

