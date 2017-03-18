EMPLOYEE = load '/home/acadgild/Downloads/employee_details.txt' using PigStorage(',')
as (id:int,name:chararray,salary:double,rank:int);
EXPENSES = load '/home/acadgild/Downloads/employee_expenses.txt' using PigStorage('\t') 
as (id:int,expenses:double);

EMP_EXPENSES = join EMPLOYEE by id, EXPENSES by id;

EMP_EXPENSES_GROUP = group EMP_EXPENSES by expenses; 

EMP_EXPENSES_ORDER = order EMP_EXPENSES_GROUP by group desc;

EMP_EXPENSES_LIMIT = limit EMP_EXPENSES_ORDER 1;
EMP_EXPENSES_FLATTEN = foreach EMP_EXPENSES_LIMIT generate group,flatten(EMP_EXPENSES);

EMP_EXPENSE_HIGH = order EMP_EXPENSES_FLATTEN by EMP_EXPENSES::EMPLOYEE::name asc;

EMP_EXPENESE_H = foreach EMP_EXPENSE_HIGH generate EMP_EXPENSES::EMPLOYEE::id,EMP_EXPENSES::EMPLOYEE::name,group;

store EMP_EXPENESE_H into '/home/acadgild/Downloads/HighEmpExpenses';
