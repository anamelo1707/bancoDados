SELECT * FROM clientesa
WHERE nome LIKE '%Ana%';


EXPLAIN SELECT * FROM clientesa WHERE nome LIKE '%Ana%';


CREATE INDEX idx_clientesa_nome ON clientesa(nome);


EXPLAIN SELECT * FROM clientesa WHERE nome LIKE '%Ana%';


ALTER TABLE clientesa
ALTER COLUMN telefone TYPE INT USING telefone::integer;


ALTER TABLE produtosa
ALTER COLUMN estoque TYPE VARCHAR(20) USING estoque::varchar;


CREATE USER ana WITH PASSWORD '1234';

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO ana;


CREATE USER joao WITH PASSWORD '1234';

GRANT SELECT ON clientesa TO joao;




SELECT c.nome, p.data_pedido
FROM clientesa c
INNER JOIN pedidosa p ON c.id = p.id_cliente;


SELECT c.nome AS cliente, p.data_pedido
FROM clientesa c
LEFT JOIN pedidosa p ON c.id = p.id_cliente;


SELECT c.nome AS cliente, p.data_pedido
FROM clientesa c
RIGHT JOIN pedidosa p ON c.id = p.id_cliente;


SELECT p.pedidos_id, v.nome AS vendedor, p.data_pedido
FROM pedidosa p
INNER JOIN vendedoresa v ON p.id_vendedor = v.vendedores_id;


SELECT p.pedidos_id, v.nome AS vendedor, p.data_pedido
FROM pedidosa p
LEFT JOIN vendedoresa v ON p.id_vendedor = v.vendedores_id;


SELECT p.pedidos_id, v.nome AS vendedor, p.data_pedido
FROM pedidosa p
RIGHT JOIN vendedoresa v ON p.id_vendedor = v.vendedores_id;


SELECT i.id_pedido, pr.nome AS produto, i.quantidade, i.preco_unitario
FROM itens_pedidoa i
INNER JOIN produtosa pr ON i.id_produto = pr.produto_id;


SELECT i.id_pedido, pr.nome AS produto, i.quantidade, i.preco_unitario
FROM itens_pedidoa i
LEFT JOIN produtosa pr ON i.id_produto = pr.produto_id;


SELECT i.id_pedido, pr.nome AS produto, i.quantidade, i.preco_unitario
FROM itens_pedidoa i
RIGHT JOIN produtosa pr ON i.id_produto = pr.produto_id;


SELECT pag.pagamentos_id, p.pedidos_id, pag.valor_pago, pag.metodo_pagamento, pag.data_pagamento
FROM pagamentosa pag
INNER JOIN pedidosa p ON pag.id_pedido = p.pedidos_id;


SELECT pag.pagamentos_id, p.pedidos_id, pag.valor_pago, pag.metodo_pagamento, pag.data_pagamento
FROM pagamentosa pag
LEFT JOIN pedidosa p ON pag.id_pedido = p.pedidos_id;


SELECT pag.pagamentos_id, p.pedidos_id, pag.valor_pago, pag.metodo_pagamento, pag.data_pagamento
FROM pagamentosa pag
RIGHT JOIN pedidosa p ON pag.id_pedido = p.pedidos_id;


UPDATE vendedoresa
SET telefone = '0000-0000'
WHERE telefone IS NULL;

UPDATE clientesa
SET email = 'email@nao-informado.com'
WHERE email IS NULL;











