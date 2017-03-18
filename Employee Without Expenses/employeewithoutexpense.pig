EMPLOYEE = load '/home/acadgild/Downloads/employee_details.txt' using PigStorage(',')
as (id:int,name:chararray,salary:double,rank:int);
EXPENSES = load '/home/acadgild/Downloads/employee_expenses.txt' using PigStorage('\t') 
as (id:int,expenses:double);

EMP_EXPENSES = join EMPLOYEE by id left, EXPENSES by id;

EMP_EXPENSES = filter EMP_EXPENSES by EXPENSES::expenses is null;

EMP_EXP_WITHOUT_EXPENSES = foreach EMP_EXPENSES generate EMPLOYEE::id,EMPLOYEE::name;

store EMP_EXP_WITHOUT_EXPENSES into '/home/acadgild/Downloads/EmployeeWithoutExpenses';

