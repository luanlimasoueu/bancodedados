create database pucmg2_sql

create table Aluno 
(
	matricula int,
	nome varchar(30),
	constraint pk_matricula primary key (matricula)
);

insert into Aluno (matricula, nome) values ( 10, 'Maria')

select * from Aluno

create table Empregado (
	MatEmp smallint not null,
	NomEmp char(30) not null,
	EndEmp char(80) null,
	CidEmp char(20) null,
	constraint pk_emp primary key (MatEmp)
)

insert into Empregado (MatEmp, NomEmp,EndEmp, CidEmp) values ( 1, 'Maria', 'São Paulo', 'São Paulo')

select * from Emprego

create table Dependente (
	NomDep char(30) not null,
	DatNasc date,
	MatEmp smallint not null,
	constraint pk_dep primary key (MatEmp),
	constraint fk_emp_dep foreign key (MatEmp) references Emprego (MatEmp)
)

drop table Dependente

select * from Dependente

alter table Empregado add uf_emp char (2) null

select * from Empregado


alter table Dependente drop constraint pk_dep


alter table Dependente add constraint  pk_dep primary key (MatEmp)


#

insert into Empregado (MatEmp ,NomEmp ,EndEmp ,CidEmp)
	values(2,'Mario', 'Rua 4', 'Belo Horizonte')
	
	
insert into Dependente (NomDep ,DatNasc ,MatEmp)
	values ('Carlos Ramos', '2023-10-01', 1)

select * from Dependente

select * from Empregado 

insert into Dependente (NomDep ,DatNasc ,MatEmp)
	values ('Mario', '2023-10-01', 3)
	
	
select * from Dependente