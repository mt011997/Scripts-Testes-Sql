-- Tabela clientes

    CREATE TABLE IF NOT EXISTS clientes(
        id BIGSERIAL PRIMARY KEY,
        nome VARCHAR(50) NOT NULL,
        lealdade INT NOT NULL
);

-- Tabela endereços
    CREATE TABLE IF NOT EXISTS enderecos(
        cep VARCHAR(9) NOT NULL,
        rua VARCHAR(50) NOT NULL,
        numero INT NOT NULL,
        bairro VARCHAR(50) NOT NULL,
        complemento VARCHAR(100),
        cliente_id INT UNIQUE NOT NULL,
        FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE
);
-- Tabela pedidos
    CREATE TABLE IF NOT EXISTS pedidos(
        id BIGSERIAL PRIMARY KEY,
        status VARCHAR(50) NOT NULL,
        cliente_id INT NOT NULL,
        FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE
    );
-- Tabela produtos
    CREATE TABLE IF NOT EXISTS produtos(
        id BIGSERIAL PRIMARY KEY,
        nome VARCHAR(100) UNIQUE NOT NULL,
        tipo VARCHAR(30) NOT NULL,
        preço DECIMAL(8, 2) NOT NULL,
        pts_de_lealdade INT NOT NULL
    );
-- Tabela produtos_pedidos

    CREATE TABLE IF NOT EXISTS produtos_pedidos(
        pedido_id INT NOT NULL,
        produto_id INT NOT NULL,
        FOREIGN KEY (pedido_id) REFERENCES pedidos(id) ON DELETE CASCADE,
        FOREIGN KEY (produto_id) REFERENCES produtos(id) ON DELETE CASCADE
    );
    
INSERT INTO clientes
  (nome, lealdade)
VALUES
  ('Paula', 64),
  ('Francisco', 168),
  ('Elise', 24),
  ('Marcelo', 48),
  ('Laura', 36);

INSERT INTO enderecos
  (cep, rua, numero, bairro, complemento, cliente_id)
VALUES
  ('09092-909', 'Rua 1', 121, 'Bairro 1', 'apto. 302', 1),
  ('12345-995', 'Rua 2', 254, 'Bairro 2', null, 2),
  ('54625-845', 'Rua 3', 1050, 'Bairro 3', null, 3),
  ('65655-321', 'Rua 4', 79, 'Bairro 4', 'APTO. 505', 4),
  ('15484-565', 'Rua 5', 32, 'Bairro 5', null, 5);

INSERT INTO produtos
  (nome, tipo, preço, pts_de_lealdade)
VALUES
  ('Big Serial', 'Burguer', 24.99, 12),
  ('Varchapa', 'Burguer', 32.99, 16),
  ('Update sem WHERE', 'Burguer', 42.99, 20),
  ('Um pra Dois', 'Burguer', 49.99, 24),
  ('DELETE sem WHERE', 'Burguer', 54.99, 32),
  ('Fritas', 'Acompanhamento', 14.99, 8),
  ('Cebola', 'Acompanhamento', 19.99, 12),
  ('Coca-Cola', 'Bebida', 5.99, 6),
  ('Fanta', 'Bebida', 5.99, 6),
  ('Guaraná', 'Bebida', 5.99, 6);


INSERT INTO pedidos
    (status, cliente_id)
VALUES
  ('Em preparo', 1),
  ('Finalizado', 2),
  ('Recebido', 3),
  ('Entregue', 4),
  ('Recebido', 5);

INSERT INTO produtos_pedidos
  (pedido_id, produto_id)
VALUES
  (1, 4),
  (1, 2),
  (1, 6),
  (2, 2),
  (2, 4),
  (2, 7),
  (2, 9),
  (3, 5),
  (3, 6),
  (3, 9),
  (4, 1),
  (4, 1),
  (4, 6),
  (4, 10),
  (5, 3),
  (5, 2),
  (5, 7),
  (5, 8);   
 
INSERT INTO clientes (nome, lealdade)
VALUES ('Georgia', 0);
 
INSERT INTO pedidos (status, cliente_id)
VALUES ('Recebido', (SELECT clientes.id FROM clientes WHERE clientes.nome = 'Georgia')); 

    INSERT INTO produtos_pedidos (pedido_id, produto_id)
    VALUES 
    ((SELECT pedidos.id FROM pedidos WHERE pedidos.id = (SELECT clientes.id FROM clientes WHERE clientes.nome = 'Georgia')), 
    (SELECT produtos.id FROM produtos WHERE produtos.nome = 'Big Serial') 
    ),  
    ((SELECT pedidos.id FROM pedidos WHERE pedidos.id = (SELECT clientes.id FROM clientes WHERE clientes.nome = 'Georgia')),
    (SELECT produtos.id FROM produtos WHERE produtos.nome = 'Varchapa')
    ),
    ((SELECT pedidos.id FROM pedidos WHERE pedidos.id = (SELECT clientes.id FROM clientes WHERE clientes.nome = 'Georgia')),
	(SELECT produtos.id FROM produtos WHERE produtos.nome = 'Fritas')
	),
	((SELECT pedidos.id FROM pedidos WHERE pedidos.id = (SELECT clientes.id FROM clientes WHERE clientes.nome = 'Georgia')),
	(SELECT produtos.id FROM produtos WHERE produtos.nome = 'Coca-Cola')
    ),
	((SELECT pedidos.id FROM pedidos WHERE pedidos.id = (SELECT clientes.id FROM clientes WHERE clientes.nome = 'Georgia')),
	(SELECT produtos.id FROM produtos WHERE produtos.nome = 'Coca-Cola')
	);
	
    SELECT
        c.id, c.nome, c.lealdade, pedidos.id, pedidos.status, cliente_id, produto_id, p.nome, p.tipo, p.preço, p.pts_de_lealdade
    FROM
        pedidos  
        JOIN produtos_pedidos pp ON pedidos.id = pp.pedido_id
        JOIN produtos p ON pp.produto_id = p.id
        JOIN clientes c ON pedidos.cliente_id = c.id
    WHERE 
        c.nome = 'Georgia';
        
   UPDATE
	clientes c
SET
	lealdade = (SELECT sum(p.pts_de_lealdade) FROM pedidos
	JOIN produtos_pedidos pp ON pedidos.id = pp.pedido_id
	JOIN produtos p ON pp.produto_id = p.id
	JOIN clientes c ON pedidos.cliente_id = c.id 
	WHERE c.nome = 'Georgia')
        WHERE c.nome = 'Georgia'
RETURNING *;

DELETE FROM clientes c WHERE c.nome = 'Marcelo'
RETURNING *;

 SELECT
        c.id, c.nome, c.lealdade, pedidos.id, pedidos.status, cliente_id, produto_id, p.nome, p.tipo, p.preço, p.pts_de_lealdade
    FROM
        pedidos  
        JOIN produtos_pedidos pp ON pedidos.id = pp.pedido_id
        JOIN produtos p ON pp.produto_id = p.id
        JOIN clientes c ON pedidos.cliente_id = c.id
    WHERE 
        c.nome = 'Georgia';
        
 SELECT pp.pedido_id, p.status, pp.produto_id, pr.nome, pr.tipo, pr.preço, pr.pts_de_lealdade as pontos_de_lealdade_do_produto
    FROM produtos_pedidos pp
    JOIN produtos pr ON pp.produto_id = pr.id
    JOIN pedidos p ON pp.pedido_id = p.id
    JOIN clientes c ON p.cliente_id = c.id;
    
   SELECT pp.pedido_id Id
    FROM produtos_pedidos pp
    JOIN produtos pr ON pp.produto_id = pr.id
    JOIN pedidos p ON pp.pedido_id = p.id
    JOIN clientes c ON p.cliente_id = c.id
    WHERE pr.nome = 'Fritas';
    
   SELECT c.nome gostam_de_Fritas
    FROM produtos_pedidos pp
    JOIN produtos pr ON pp.produto_id = pr.id
    JOIN pedidos p ON pp.pedido_id = p.id
    JOIN clientes c ON p.cliente_id = c.id
    WHERE pr.nome = 'Fritas';
    
     SELECT sum(p.preço)
    FROM pedidos
	JOIN produtos_pedidos pp on pedidos.id = pp.pedido_id
	JOIN produtos p on pp.produto_id = p.id
	JOIN clientes c on pedidos.cliente_id = c.id 
    WHERE c.nome = 'Laura';
    
  SELECT  p.nome, count(p.nome)
    FROM pedidos
    JOIN produtos_pedidos pp ON pedidos.id = pp.pedido_id
    JOIN produtos p ON pp.produto_id = p.id
    JOIN clientes c ON pedidos.cliente_id = c.id
    GROUP BY p.nome
    ORDER BY p.nome;