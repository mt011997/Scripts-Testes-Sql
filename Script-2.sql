create table if not exists cursos(
	id BIGSERIAL CONSTRAINT pk_cursos primary key,
	nome VARCHAR(200),
	tema VARCHAR(300),
	duracao INTEGER not null
);

create table if not exists livros(
	id BIGSERIAL constraint pk_livros PRIMARY key,
	nome VARCHAR(200) unique,
	autor VARCHAR(200),
	paginas INTEGER not null,
	CHECK (paginas > 0)
);

create table if not exists animais( 
	id BIGSERIAL constraint pk_animais primary key,
	nome VARCHAR(200),
	especie varchar(200),
	raca VARCHAR(200),
	idade INTEGER not null,
	CHECK(idade > 0)
);

create table if not exists carros(
	placa VARCHAR(10) unique primary key,
	modelo VARCHAR(100),
	marca VARCHAR(100),
	ano INTEGER not null,
	CHECK(ano > 0),
	km_rodados NUMERIC(1000,2) not null,
	alugado BOOLEAN
);

INSERT into
	carros(placa, modelo, marca, ano, km_rodados, alugado)
values 
	('2IJU4H283J', 'CARRO', 'CARRO TBM', 2020, 100.20, true),
	('2IJU4H283K', 'CARRO', 'CARRO TBM', 2020, 100.20, false);

	
create table if not exists coisas(
	id BIGSERIAL primary key,
	nome varchar(200) unique,
	autor varchar(200),
	paginas int not null,
	check(paginas > 0)
);

insert into 
coisas(nome, autor, paginas) 
values
('Como Fazer Amigos e Influenciar Pessoas', 'Dale Carnegie', 256),
('O Poder do Hábito', 'Charles Duhigg', 408),
('Os 7 Hábitos das Pessoas Altamente Eficazes', 'Sthephen R. Covey', 462),
('Mindset: A Nova Psicologia do Sucesso', 'Carol S. Dweck', 312),
('Inteligência Emocional', 'Daniel Goleman', 384),
('Comece Pelo Porquê', 'Simon Sinek', 256),
('O Milagre da Manhã', 'Hal Elrod', 196),
('A Coragem de Ser Imperfeito', 'Brené Brown', 208),
('A tríade do tempo', 'Christian Barbosa', 208),
('O Corpo Fala', 'Pierre Weil', 288),
('A Arte de Ler Mentes', 'Henrik Fexeus', 256),
('Inteligência Visual', 'Amy E. Herman', 336),
('O Poder da Presença', 'Amy Cuddy', 256),
('Rápido e Devagar', 'Daniel Kahneman', 608),
('Pense de Novo', 'Adam Grant', 304),
('A Voz na Sua Cabeça', 'Ethan Kross', 240)

select * from coisas;
select * from coisas where paginas > 200;
select nome from coisas where paginas > 400;
select * from coisas where nome like 'O%';
select autor from coisas where autor like 'A%';
select * from coisas where nome like 'A%' and paginas > 250;
select nome, paginas from coisas where nome like '%o';

ALTER TABLE
  usuarios
ADD
  COLUMN email VARCHAR(50);
 
ALTER TABLE
  usuarios
ALTER COLUMN
  idade
SET
  NOT NULL;
 
ALTER TABLE usuarios RENAME email TO apelido;

ALTER TABLE usuarios DROP COLUMN IF EXISTS apelido;

ALTER TABLE
  usuarios
ADD
  COLUMN email VARCHAR(50);
 
UPDATE
  usuarios
SET
  email = 'adm@kenzie.com';

UPDATE
  usuarios
SET
  email = 'fabio@kenzie.com.br'
WHERE
  id = 1
RETURNING *;

DELETE FROM
  usuarios
WHERE
  id = 3
RETURNING *;

DELETE FROM
  usuarios
WHERE
  email = 'adm@kenzie.com'
RETURNING *;
