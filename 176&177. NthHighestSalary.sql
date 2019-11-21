#For example, given the above Employee table, the nth highest salary where n = 2 is 200. 
#If there is no nth highest salary, then the query should return null

#Leetcode 176 easy
# select the second highest salary

select max(salary) from salaries
where salary < (select max(salary) from salaries);


# Leetcode 177 medium
# select the Nth highest salary 

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

# n = 3: select the third highest salary
# n = 2: select the second highest salary
select NthHighestSalary(3);  
