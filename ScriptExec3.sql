// Criando tabela de projeto
create table projeto (
projetoID int primary key,
nome varchar(50),
descricao varchar(255),
data_inicio date,
data_prazo date
);

//Verificando a tabela tarefa
select * from tarefa

// Criando tabela categoria
create table categoria (
categoriaID int primary key,
nome varchar(25),
descricao varchar(255)
);

//Verificando a tabela projeto
select * from categoria

// Criando tabela de tarefa
create table tarefa (
tarefaID int primary key,
nome varchar(50),
descricao varchar(255),
data_inicio date,
data_prazo date,
concluida bool,
projetoID int,
categoriaID int,
foreign key (projetoID) references projeto(projetoID),
foreign key (categoriaID) references categoria(categoriaID)
);

insert into categoria (categoriaid, nome, descricao)
values (1, 'Tarefa pessoal', 'Tarefas relacionadas a assuntos pessoais'),(
2, 'Tarefa profissional', 'Tarefas relacionadas ao trabalho'),(
3, 'Tarefa acadêmica', 'Tarefas relacionadas a estudos');

insert into tarefa (tarefaID, nome, descricao, projetoID, categoriaID, data_inicio, data_prazo, concluida) values
  (1, 'Tarefa 1', 'Descrição da Tarefa 1', 1, 1, '2023-01-05', '2023-01-15', true),
  (2, 'Tarefa 2', 'Descrição da Tarefa 2', 1, 2, '2023-01-10', '2023-01-20', false),
  (3, 'Tarefa 3', 'Descrição da Tarefa 3', 2, 3, '2023-03-05', '2023-03-15', false),
  (4, 'Tarefa 4', 'Descrição da Tarefa 4', 2, 1, '2023-03-10', '2023-03-20', false),
  (5, 'Tarefa 5', 'Descrição da Tarefa 5', 3, 2, '2023-05-05', '2023-05-15', false);

insert into projeto (projetoid, nome, descricao, data_inicio, data_prazo) values
  (1, 'Projeto A', 'Descrição do Projeto A', '2023-01-01', '2023-02-28'),
  (2, 'Projeto B', 'Descrição do Projeto B', '2023-03-01', '2023-04-30'),
  (3, 'Projeto C', 'Descrição do Projeto C', '2023-05-01', '2023-06-30');

select tarefa.nome as tarefa, 
	projeto.nome as projeto, 
	categoria.nome as categoria, 
	tarefa.data_prazo, 
	tarefa.concluida
from tarefa
inner join projeto on tarefa.projetoID = projeto.projetoID
inner join categoria on tarefa.categoriaID = categoria.categoriaID


select *
from tarefa
where concluida = true;


select *
from tarefa
where data_prazo < CURRENT_DATE   and concluida = false;

 
select 
	projeto.nome as projeto, 
	COUNT(tarefa.tarefaID) AS quantidade_tarefas
from projeto
left join tarefa on projeto.projetoID = tarefa.projetoID
group by projeto.projetoID, projeto.nome;
