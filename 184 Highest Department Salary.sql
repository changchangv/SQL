# 184. The Employee table holds all employees. Every employee has an Id, a salary, and there is also a column for the department Id.
# | Id | Name  | Salary | DepartmentId |
# The Department table holds all departments of the company.
# | Id | Name  |
###########   Q: Write a SQL query to find employees who have the highest salary in each of the departments. ############
select e.name, e.salary, e.departmentid, d.name
from employee e
left join department d on e.departmentid = d.id
where (departmentid, salary) in  (select departmentid, max(salary)
								  from employee
								  group by departmentid); 