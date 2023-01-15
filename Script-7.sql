create table if not exists departamentos(
	id bigserial primary key,
	nome varchar(100) unique not null,
	numero_de_funcionarios int not null
);

create table if not exists gerentes(
	id bigserial primary key,
	nome varchar(100) not null,
	sobrenome varchar(100) not null
);

alter table gerentes add column departamento_id int unique not null;
alter table gerentes add foreign key (departamento_id) references departamentos (id);

alter table gerentes drop column departamento_id;

