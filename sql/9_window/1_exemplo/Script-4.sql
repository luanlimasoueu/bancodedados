use sqlnotes;


create table Estudante(
	Nome nvarchar(255),
	Sexo nvarchar(10),
	Idade int
)



insert into Estudante 
  values ('Luan Nunes', 'masculino', 28), ('Alan Nunes', 'masculino', 21), 
	 ('Karynne Amâncio', 'feminino', 20), ('João Guilherme', 'masculino', 18),('Grace Hopper', 'feminino', 86)

select 
	nome,
	sexo,
	idade,
	avg(idade) over (partition by sexo)
		as 'Média de idade'
from Estudante


	 
	 