create table if not exists clientes(
	id bigserial primary key,
	nome varchar(50) not null,
	lealdade int not null
);

create table if not exists enderecos(
	cep varchar(9) not null,
	rua varchar(50) not null,
	numero int not null,
	bairro varchar(50) not null,
	complemento varchar(100),
	cliente_id int unique not null,
	constraint fk_cliente foreign key (cliente_id) references clientes(id)
);

 CREATE TABLE IF NOT EXISTS pedidos(
        id BIGSERIAL PRIMARY KEY,
        status VARCHAR(50) NOT NULL,
        cliente_id INT NOT NULL,
        CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES clientes(id)
 );
 
    CREATE TABLE IF NOT EXISTS produtos(
        id BIGSERIAL PRIMARY KEY,
        nome VARCHAR(100) UNIQUE NOT NULL,
        tipo VARCHAR(30) NOT NULL,
        preço FLOAT(8) NOT NULL,
        pts_de_lealdade INT NOT NULL
    );