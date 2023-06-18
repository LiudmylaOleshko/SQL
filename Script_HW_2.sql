select * from employees;

select * from salary;
select * from employee_salary;

select * from roles;
select * from roles_employee;

/*Добавляю зарплату в таблицу salary*/
insert into salary(monthly_salary)
values  (2600),
		(2700),
		(2800),
		(2900),
		(3000),
		(1000),
		(900),
		(800),
		(700),
		(600);
	

/* 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.*/
select employee_name, monthly_salary from employees e 
join employee_salary es 
on e.id = es.employee_id
join salary s 
on s.id = salary_id;

/*2. Вывести всех работников у которых ЗП меньше 2000.*/
select e.employee_name, s.monthly_salary from employees e
join employee_salary es
on e.id = es.employee_id
join salary s 
on salary_id = s.id
where monthly_salary < 2000
order by monthly_salary ;

/*3. Вывести все зарплатные позиции, но работник по ним не назначен. 
 * (ЗП есть, но не понятно кто её получает.)*/
select monthly_salary, employee_id from salary s
left outer join employee_salary es
on s.id = es.salary_id
where employee_id is null
order by monthly_salary;

/*4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. 
 * (ЗП есть, но не понятно кто её получает.)*/
select monthly_salary, employee_id  from salary s
left outer join employee_salary es
on s.id = es.salary_id
where monthly_salary <2000 
and employee_id is null
order by monthly_salary;

/* 5. Найти всех работников кому не начислена ЗП.*/
select e.id, e.employee_name, salary_id  from employees e
left outer join employee_salary es
on e.id = es.employee_id
where salary_id is null
order by 1;

/* 6. Вывести всех работников с названиями их должности.*/
select e.employee_name, r.role_name from employees e 
join roles_employee re 
on e.id = re.employee_id
join roles r 
on re.role_id = r.id;

/*7. Вывести имена и должность только Java разработчиков.*/
select e.employee_name, r.role_name from employees e 
join roles_employee re 
on e.id = re.employee_id
join roles r 
on re.role_id = r.id
where role_name like '%ava_dev%';

/*8. Вывести имена и должность только Python разработчиков.*/
select e.employee_name, r.role_name from employees e 
join roles_employee re 
on e.id = re.employee_id
join roles r 
on re.role_id = r.id
where role_name like '%ython_dev%';

/*9. Вывести имена и должность всех QA инженеров.*/
select e.employee_name, r.role_name from employees e 
join roles_employee re 
on e.id = re.employee_id
join roles r 
on re.role_id = r.id
where role_name like '%QA%';

/*10. Вывести имена и должность ручных QA инженеров.*/
select e.employee_name, r.role_name from employees e 
join roles_employee re 
on e.id = re.employee_id
join roles r 
on re.role_id = r.id
where role_name like '%anual%QA%';

/*11. Вывести имена и должность автоматизаторов QA*/
select e.employee_name, r.role_name from employees e 
join roles_employee re 
on e.id = re.employee_id
join roles r 
on re.role_id = r.id
where role_name like '%uto%QA%';

/*12. Вывести имена и зарплаты Junior специалистов*/
select employee_name, monthly_salary, role_name
from employees e 
join roles_employee re 
on e.id = re.employee_id
join roles r  
on re.role_id = r.id
join employee_salary es 
on re.employee_id = es.employee_id
join salary s
on es.salary_id = s.id
where role_name like '%unior%' ;

/* 13. Вывести имена и зарплаты Middle специалистов*/
select employee_name, monthly_salary, role_name
from employees e 
join roles_employee re 
on e.id = re.employee_id
join roles r  
on re.role_id = r.id
join employee_salary es 
on re.employee_id = es.employee_id
join salary s
on es.salary_id = s.id
where role_name like '%iddle%' ;

/* 14. Вывести имена и зарплаты Senior специалистов*/
select employee_name, monthly_salary, role_name
from employees e 
join roles_employee re 
on e.id = re.employee_id
join roles r  
on re.role_id = r.id
join employee_salary es 
on re.employee_id = es.employee_id
join salary s
on es.salary_id = s.id
where role_name like '%enior%' ;

/*15. Вывести зарплаты Java разработчиков*/
select e.employee_name, r.role_name, s.monthly_salary 
from employees e 
join roles_employee re 
on e.id = re.employee_id
join roles r 
on re.role_id = r.id
join employee_salary es 
on re.employee_id = es.employee_id
join salary s
on es.salary_id = s.id
where role_name like '%ava_dev%';

/*16. Вывести зарплаты Python разработчиков*/
select e.employee_name, r.role_name, s.monthly_salary 
from employees e 
join roles_employee re 
on e.id = re.employee_id
join roles r 
on re.role_id = r.id
join employee_salary es 
on re.employee_id = es.employee_id
join salary s
on es.salary_id = s.id
where role_name like '%ython%dev%';

/* 17. Вывести имена и зарплаты Junior Python разработчиков*/
select e.employee_name, r.role_name, s.monthly_salary 
from employees e 
join roles_employee re 
on e.id = re.employee_id
join roles r 
on re.role_id = r.id
join employee_salary es 
on re.employee_id = es.employee_id
join salary s
on es.salary_id = s.id
where role_name like '%unior%ython%';

/*18. Вывести имена и зарплаты Middle JS разработчиков*/
select e.employee_name, r.role_name, s.monthly_salary 
from employees e 
join roles_employee re 
on e.id = re.employee_id
join roles r 
on re.role_id = r.id
join employee_salary es 
on re.employee_id = es.employee_id
join salary s
on es.salary_id = s.id
where role_name like '%iddle%J%S%';

/*19. Вывести имена и зарплаты Senior Java разработчиков*/
select e.employee_name, r.role_name, s.monthly_salary 
from employees e 
join roles_employee re 
on e.id = re.employee_id
join roles r 
on re.role_id = r.id
join employee_salary es 
on re.employee_id = es.employee_id
join salary s
on es.salary_id = s.id
where role_name like '%enior%ava_dev%';

/*20. Вывести зарплаты Junior QA инженеров*/
select r.role_name, s.monthly_salary 
from roles_employee re 
join roles r 
on re.role_id = r.id
join employee_salary es 
on re.employee_id = es.employee_id
join salary s
on es.salary_id = s.id
where role_name like '%unior%Q%A%';

/* 21. Вывести среднюю зарплату всех Junior специалистов*/
select AVG(s.monthly_salary) 
from roles_employee re 
join roles r 
on re.role_id = r.id
join employee_salary es 
on re.employee_id = es.employee_id
join salary s
on es.salary_id = s.id
where role_name like '%unior%';

/*22. Вывести сумму зарплат JS разработчиков*/
select SUM(s.monthly_salary)
from roles_employee re 
join roles r 
on re.role_id = r.id
join employee_salary es 
on re.employee_id = es.employee_id
join salary s
on es.salary_id = s.id
where role_name like '%J%S%dev%';

/*23. Вывести минимальную ЗП QA инженеров*/
select MIN(s.monthly_salary)
from roles_employee re 
join roles r 
on re.role_id = r.id
join employee_salary es 
on re.employee_id = es.employee_id
join salary s
on es.salary_id = s.id
where role_name like '%QA%';


/*24. Вывести максимальную ЗП QA инженеров*/
select MAX(s.monthly_salary)
from roles_employee re 
join roles r 
on re.role_id = r.id
join employee_salary es 
on re.employee_id = es.employee_id
join salary s
on es.salary_id = s.id
where role_name like '%QA%';

/*25. Вывести количество QA инженеров - с учетом получения з/пл*/
select count(s.monthly_salary)
from roles_employee re 
join roles r 
on re.role_id = r.id
join employee_salary es 
on re.employee_id = es.employee_id
join salary s
on es.salary_id = s.id
where role_name like '%QA%';
/*количество QA инженеров - согласно распределения ролей*/
select count(id) from employees where id in
(select employee_id from roles_employee where role_id in 
(select id from roles where role_name like '%QA%'));


/*26. Вывести количество Middle специалистов.*/
select count(re.id)
from roles_employee re 
join roles r 
on re.role_id = r.id
where r.role_name like '%iddle%';

/*27. Вывести количество разработчиков*/
select count(re.role_id)
from roles_employee re 
join roles r 
on re.role_id = r.id
where r.role_name like '%dev%';

/*28. Вывести фонд (сумму) зарплаты разработчиков.*/
select SUM(s.monthly_salary)
from roles_employee re 
join roles r 
on re.role_id = r.id
join employee_salary es
on re.employee_id = es.employee_id
join salary s 
on es.salary_id = s.id
where r.role_name like '%dev%';

/*29. Вывести имена, должности и ЗП всех специалистов по возрастанию*/
select e.employee_name, es.employee_id, r.role_name, s.monthly_salary 
from roles r 
join roles_employee re 
on r.id = re.role_id
right outer join employees e
on re.employee_id = e.id
full outer join employee_salary es 
on e.id = es.employee_id
left outer join salary s
on es.salary_id =  s.id
order by s.monthly_salary ASC;

/*30. Вывести имена, должности и ЗП всех специалистов 
 * по возрастанию у специалистов у которых ЗП от 1700 до 2300*/
select e.employee_name, es.employee_id, r.role_name, s.monthly_salary 
from roles r 
join roles_employee re 
on r.id = re.role_id
right outer join employees e
on re.employee_id = e.id
full outer join employee_salary es 
on e.id = es.employee_id
left outer join salary s
on es.salary_id =  s.id
where s.Monthly_salary between 1700 and 2300
order by s.monthly_salary ASC;

/* 31. Вывести имена, должности и ЗП всех специалистов 
 * по возрастанию у специалистов у которых ЗП меньше 2300*/
select e.employee_name, es.employee_id, r.role_name, s.monthly_salary 
from roles r 
join roles_employee re 
on r.id = re.role_id
right outer join employees e
on re.employee_id = e.id
full outer join employee_salary es 
on e.id = es.employee_id
left outer join salary s
on es.salary_id =  s.id
where s.Monthly_salary < 2300
order by s.monthly_salary ASC;

/* 32. Вывести имена, должности и ЗП всех специалистов 
 * по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000*/
select e.employee_name, es.employee_id, r.role_name, s.monthly_salary 
from roles r 
join roles_employee re 
on r.id = re.role_id
right outer join employees e
on re.employee_id = e.id
full outer join employee_salary es 
on e.id = es.employee_id
left outer join salary s
on es.salary_id =  s.id
where s.Monthly_salary in (1100, 1500, 2000)
order by s.monthly_salary ASC;
