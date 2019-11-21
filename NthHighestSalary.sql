# select the second highest salary
#select max(salary) from salaries
#
#For example, given the above Employee table, the nth highest salary where n = 2 is 200. 
#If there is no nth highest salary, then the query should return null
 
delimiter $$
create function NthHighestSalary(n int) returns int
begin
declare result int;
declare m int;
set m=n-1;
	select distinct salary into result from salaries
    order by salary desc
    limit m,1;
return result;
end$$
delimiter ;
select NthHighestSalary(3);  
