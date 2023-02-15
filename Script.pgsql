create table if not exists usuarios(
	id BIGSERIAL constraint pk_usuarios primary key,
	nome VARCHAR(100) not null,
	idade INTEGER
);

