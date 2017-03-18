EMPLOYEE = load '/home/acadgild/Downloads/employee_details.txt' using PigStorage(',')
as (id:int,name:chararray,salary:double,rank:int);
EXPENSES = load '/home/acadgild/Downloads/employee_expenses.txt' using PigStorage('\t') 
as (id:int,expenses:double);

EMP_EXPENSES = join EMPLOYEE by id, EXPENSES by id;

EMP_EXP_ORDER_FOR = foreach EMP_EXPENSES generate EMPLOYEE::id,EMPLOYEE::name,EXPENSES::expenses;

EMP_EXP_ORDER_D = distinct EMP_EXP_ORDER_FOR;

store EMP_EXP_ORDER_D into '/home/acadgild/Downloads/EmployeeWithExpenses';

