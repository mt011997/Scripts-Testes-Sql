create table if not exists usuarios(
	id BIGSERIAL primary key,
	nome varchar(100),
	pais_1 varchar(100),
	estado_1 varchar(100)
);

alter table usuarios 
	add column pais_2 varchar(100),
	add column estado_2 varchar(100),
	add column pais_3 varchar(100),
	add column estado_3 varchar(100)
	
insert into usuarios 
	(nome, estado_1, pais_1, estado_2, pais_2, estado_3, pais_3)
VALUES
  (
    'Roberto',
    'São Paulo', 'Brasil',
    'Paraná', 'Brasil',
    'Rio de Janeiro', 'Brasil'
  ),
  (
    'Joseph',
    'California', 'Estados Unidos',
    'Paraná', 'Brasil',
    'Rio de Janeiro', 'Brasil'
  ),
  (
    'Jorge',
    'São Paulo', 'Brasil',
    'Goiás', 'Brasil',
    null, null
  );

