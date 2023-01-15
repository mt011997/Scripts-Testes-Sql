create table if not exists enderecos(
	id bigserial primary key,
	estado varchar(100) not null,
	pais varchar(100) not null
);

create table if not exists usuarios(
	id bigserial primary key,
	nome varchar(100) not null,
	endereco_id1 int null,
	foreign key (endereco_id1) references enderecos (id)
);

alter table usuarios
  ADD COLUMN  endereco_id2  INTEGER       NULL,
  ADD COLUMN  endereco_id3  INTEGER       NULL,
  ADD FOREIGN KEY  (endereco_id2) REFERENCES enderecos (id),
  ADD FOREIGN KEY  (endereco_id3) REFERENCES enderecos (id);
  
INSERT INTO enderecos
  (estado, pais)
VALUES
  ('São Paulo', 'Brasil'),
  ('Goiás', 'Brasil'),
  ('Paraná', 'Brasil'),
  ('Rio de Janeiro', 'Brasil'),
  ('Califórnia', 'EUA');


INSERT INTO usuarios
  (nome, endereco_id1, endereco_id2, endereco_id3)
VALUES
  ('Roberto', 1, 3, 4),
  ('Joseph', 5, 3, 4),
  ('Jorge', 1, 2, null);
  
select * from usuarios;
