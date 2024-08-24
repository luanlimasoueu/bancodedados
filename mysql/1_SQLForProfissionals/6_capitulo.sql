create table usertable (
id int auto_increment primary key,
nome varchar(20)
)

insert into usertable(nome) values ('User1'), ('User2'), ('User3')

select * from  usertable

select * from  usertable order by id limit 2