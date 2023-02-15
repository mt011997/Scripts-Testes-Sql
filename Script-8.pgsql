create table if not exists usuarios(
	id bigserial primary key,
	nome varchar(100) not null,
	apelido varchar(100),
	idade int not null
);

create table if not exists enderecos(
	id bigserial primary key,
	pais varchar(150) not null,
	usuario_id int unique not null,
	foreign key (usuario_id) references usuarios(id) 
);

INSERT INTO usuarios
  (nome, apelido, idade)
VALUES
  ('Roberto', 'Beto', 22),
  ('Vinicius', 'Vini', 20);

INSERT INTO enderecos
  (pais, usuario_id)
VALUES
  ('Brasil', 1),
  ('Canadá', 2);

 
