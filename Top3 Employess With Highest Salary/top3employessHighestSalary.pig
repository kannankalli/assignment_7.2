EMPLOYEE = load '/home/acadgild/Downloads/employee_details.txt' using PigStorage(',') as
(id:int,name:chararray,salary:double,rank:int);

EMPLOYEEORDER = order EMPLOYEE by salary desc,name asc;

EMPLOYEEFILTER = filter EMPLOYEEORDER by id%2 == 1;

EMPLOYEELIMIT = limit EMPLOYEEFILTER 3;

store EMPLOYEELIMIT into '/home/acadgild/Downloads/highestsalary';
