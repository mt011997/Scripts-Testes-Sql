create table if not exists usuarios(
	id bigserial primary key,
	nome varchar(100) not null,
	apelido varchar(50),
	idade int not null
);

create table if not exists enderecos(
	id bigserial primary key,
	pais varchar(150) not null, 
	usuario_id int unique not null,
	foreign key (usuario_id) references usuarios(id)
);

INSERT INTO
  usuarios (nome, apelido, idade)
VALUES
  ('Letícia', 'Lê', 22),
  ('Eduardo', 'Edu', 20);

INSERT INTO
  enderecos (pais, usuario_id)
VALUES
  ('Brasil', 1),
  ('Canadá', 2);
 
select * from enderecos as e join usuarios u on e.usuario_id = u.id where u.id = 1;

select e.pais, u.nome, u.apelido, u.idade from enderecos e join usuarios u on e.usuario_id = u.id where u.id = 2
  
