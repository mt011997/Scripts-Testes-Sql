create table if not exists endereco(
	id bigserial primary key,
	pais varchar(100) not null,
	estado varchar(2) not null
);

create table if not exists pessoa(
	id bigserial primary key,
	nome varchar(100) not null,
	idade int not null,
	endereco_id int unique,
	constraint fk_enderecos foreign key (endereco_id) references endereco(id)
);

INSERT INTO
  endereco (pais, estado)
VALUES
  ('Brasil', 'SP'),
  ('Brasil', 'PR'),
  ('Brasil', 'MG'),
  ('Brasil', 'BH');

INSERT INTO
  pessoa (nome, idade, endereco_id)
VALUES
  ('Joana', 22, 1),
  ('Matheus', 25, 1),
  ('Carlos', 25, 2),
  ('Louise', 27, 3),
  ('Charlie', 21, null);
  
//inerJoin

select pessoa.nome, pessoa.idade, endereco.pais, endereco.estado from pessoa join endereco on endereco.id = pessoa.endereco_id;

//leftJoin

select p.nome, p.idade, e.pais, e.estado from pessoa as p left join endereco as e on e.id = p.endereco_id;

/rightJoin

select p.nome, p.idade, e.pais, e.estado from pessoa p right join endereco e on p.endereco_id = e.id;
 
