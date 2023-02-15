create table if not exists usuarios(
	id BIGSERIAL constraint pk_usuarios primary key,
	nome VARCHAR(100) not null,
	idade INTEGER
);

INSERT INTO
        usuarios(nome, idade)
      VALUES
        ('Patrick Nekel', 23),
        ('Eduardo', 26),
        ('Ivan', 26),
        ('Darnley', 31);


CREATE TABLE IF NOT EXISTS enderecos (id BIGSERIAL PRIMARY KEY, rua VARCHAR(150) NOT NULL);

DROP TABLE usuarios

CREATE TABLE IF NOT EXISTS usuarios (
        id BIGSERIAL PRIMARY KEY,
        nome VARCHAR(50) NOT NULL,
        idade INTEGER,
        CHECK (idade > 0),
        endereco_id INTEGER,
        CONSTRAINT fk_end_usu FOREIGN KEY(endereco_id) REFERENCES enderecos(id)
      );
     
INSERT INTO
        usuarios(nome, idade)
      VALUES
        ('Patrick Nekel', 23),
        ('Eduardo', 26),
        ('Ivan', 26),
        ('Darnley', 31);
      
SELECT * FROM usuarios;
SELECT nome FROM usuarios;
SELECT nome, idade FROM usuarios;
SELECT * FROM usuarios WHERE idade = 26;
SELECT * FROM usuarios WHERE nome LIKE 'E%';
SELECT * from usuarios WHERE nome LIKE 'I%' AND idade >= 25;
SELECT * FROM usuarios WHERE nome LIKE 'E%' OR nome LIKE 'I%';
SELECT * FROM usuarios WHERE nome NOT LIKE 'E%';