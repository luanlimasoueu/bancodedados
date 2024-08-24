create table students_1(
student_name varchar(20),
test_score int,
group_name varchar(20)
)

select * from students_1

insert into students_1 (student_name,test_score, group_name)  values ('Amanda', 2, 'A'), ('Amanda', 3, 'A'), ('Luiz', 4, 'B')

select student_name, group_name, avg(test_score) as test_score
from students_1
group by student_name, group_name