a)
SELECT empregado.nome FROM empregado  
JOIN trabalha ON trabalha.codEmpregado = empregado.codEmpregado 
JOIN companhia ON companhia.codCompanhia = trabalha.codCompanhia WHERE companhia.nome="Casas Bahia";

b)
SELECT empregado.nome, empregado.cidade FROM empregado  
JOIN trabalha ON trabalha.codEmpregado = empregado.codEmpregado 
JOIN companhia ON companhia.codCompanhia = trabalha.codCompanhia WHERE companhia.nome="GVT";

c)
SELECT empregado.nome, empregado.cidade, empregado.rua FROM empregado  
JOIN trabalha ON trabalha.codEmpregado = empregado.codEmpregado 
JOIN companhia ON companhia.codCompanhia = trabalha.codCompanhia 
WHERE companhia.nome="TIM" AND trabalha.salario >= 3000;

d)
SELECT empregado.nome, companhia.nome FROM empregado  
JOIN trabalha ON trabalha.codEmpregado = empregado.codEmpregado 
JOIN companhia ON companhia.codCompanhia = trabalha.codCompanhia 
WHERE companhia.nome!="Casas Bahia";

e)
SELECT empregado.nome FROM empregado 
 JOIN trabalha ON trabalha.codEmpregado = empregado.codEmpregado 
 JOIN companhia ON companhia.codCompanhia = trabalha.codCompanhia
 WHERE companhia.nome!="TIM" and trabalha.salario >= 5000;

f)
SELECT empregado.nome FROM ( select empregado.nome, empregado.CodEmpregado from empregado 
    JOIN trabalha ON empregado.codEmpregado = trabalha.codEmpregado 
    JOIN companhia ON companhia.codCompanhia = trabalha.codCompanhia 
    AND companhia.nome='GVT'
    JOIN gerente ON gerente.codEmpregado = empregado.codEmpregado) t1
    JOIN empregado ON empregado.nome = t1.nome AND empregado.codEmpregado != t1.codEmpregado;

g)
SELECT * FROM companhia WHERE companhia.cidade = "Cianorte" ;

h)
SELECT empregado.nome, empregado.cidade FROM (select empregado.CodEmpregado, trabalha.codCompanhia FROM empregado
JOIN gerente ON gerente.codEmpregado = empregado.CodEmpregado AND empregado.nome = 'Alexandre'
JOIN trabalha ON empregado.CodEmpregado = trabalha.CodEmpregado
JOIN companhia ON companhia.CodCompanhia = trabalha.CodCompanhia) t1
JOIN trabalha ON trabalha.codCompanhia = t1.codCompanhia 
JOIN empregado ON empregado.CodEmpregado = trabalha.CodEmpregado AND t1.CodEmpregado != empregado.CodEmpregado;

i)
SELECT empregado.nome, empregado.rua, empregado.cidade FROM (select trabalha.codEmpregado FROM trabalha 
JOIN companhia ON trabalha.codCompanhia = companhia.codCompanhia AND companhia.cidade='Cianorte') t1 
JOIN empregado ON empregado.CodEmpregado = t1.codEmpregado AND empregado.nome != 'Augusto';

j)
SELECT empregado.nome FROM empregado
 JOIN trabalha ON trabalha.CodEmpregado = empregado.CodEmpregado 
 JOIN companhia ON companhia.CodCompanhia = trabalha.CodCompanhia
 WHERE empregado.cidade = companhia.cidade;

k)
SELECT empregado.nome FROM (select empregado.CodEmpregado, empregado.rua, empregado.cidade FROM empregado 
JOIN gerente ON gerente.CodEmpregado = empregado.codEmpregado) t1 
JOIN empregado ON empregado.rua = t1.rua AND empregado.cidade = t1.cidade AND t1.codEmpregado != empregado.CodEmpregado;

l)
SELECT empregado.nome FROM (select cliente.cidade FROM cliente WHERE cliente.nome = 'João') t1 
JOIN empregado ON empregado.cidade = t1.cidade;
SELECT empregado.nome FROM (SELECT empregado.cidade FROM empregado WHERE empregado.nome = 'João') t2
JOIN empregado ON empregado.cidade = t2.cidade;

m)
SELECT empregado.nome FROM empregado
JOIN trabalha ON empregado.CodEmpregado = trabalha.codEmpregado 
JOIN companhia ON companhia.CodCompanhia = trabalha.codCompanhia WHERE companhia.nome = 'Varig'
UNION
SELECT cliente.nome FROM cliente 
WHERE cliente.cidade = 'Curitiba';


n)
SELECT empregado.nome FROM empregado 
JOIN trabalha ON trabalha.codEmpregado = empregado.codEmpregado
JOIN companhia ON companhia.codCompanhia = trabalha.codCompanhia
WHERE companhia.nome="TAM" AND empregado.cidade!="São Paulo";

o)
SELECT empregado.nome FROM empregado
JOIN trabalha ON trabalha.codEmpregado = empregado.codEmpregado 
JOIN companhia ON companhia.codCompanhia = trabalha.codCompanhia
WHERE companhia.nome="TAM" AND empregado.cidade="Maceió";

p)
SELECT companhia.nome, companhia.cidade FROM companhia  WHERE companhia.cidade="Xaxim" AND companhia.nome!="Varig";

q)
SELECT empregado.nome FROM (SELECT empregado.cidade FROM empregado
WHERE empregado.nome = 'José') t1
JOIN empregado ON empregado.cidade = t1.cidade AND empregado.nome != 'José';

r)
SELECT companhia.nome
FROM companhia
JOIN
(
  SELECT companhia.nome, companhia.codCompanhia, count(trabalha.codCompanhia) as Nempregados
from trabalha
left join companhia
on (companhia.codCompanhia = trabalha.codCompanhia)
group by
    trabalha.codCompanhia
) t1
ON companhia.codCompanhia = t1.codCompanhia
ORDER BY t1.Nempregados DESC LIMIT 1;


s)
SELECT empregado.nome, Min(trabalha.salario), companhia.nome FROM empregado 
    JOIN trabalha ON empregado.codEmpregado = trabalha.codEmpregado 
    JOIN companhia ON companhia.codCompanhia = trabalha.codCompanhia;

t)
SET SQL_SAFE_UPDATES = 0;
UPDATE empregado SET cidade = 'Brasilia' WHERE nome = 'José';

u) 
SELECT empregado.nome, trabalha.salario*0.1+trabalha.salario FROM empregado 
JOIN trabalha ON  trabalha.codEmpregado = empregado.codEmpregado 
JOIN companhia ON companhia.codCompanhia = trabalha.codCompanhia WHERE companhia.nome="Varig";
    
v)
SELECT empregado.nome, trabalha.salario*0.03+trabalha.salario FROM empregado 
JOIN trabalha ON empregado.codEmpregado = trabalha.codEmpregado 
JOIN companhia ON companhia.codCompanhia = trabalha.codCompanhia
JOIN gerente ON gerente.codEmpregado = empregado.codEmpregado;

w)
SELECT trabalha.codEmpregado, trabalha.salario*0.07+trabalha.salario FROM trabalha JOIN gerente ON gerente.codEmpregado = trabalha.codEmpregado WHERE trabalha.salario>=1200;
SELECT trabalha.codEmpregado, trabalha.salario*0.10+trabalha.salario FROM trabalha JOIN gerente ON gerente.codEmpregado != trabalha.codEmpregado WHERE trabalha.salario<=1200;

x)
DELETE 
empregado, trabalha
FROM
empregado
 INNER JOIN trabalha ON trabalha.codEmpregado = empregado.CodEmpregado JOIN companhia ON companhia.codCompanhia = trabalha.codCompanhia AND trabalha.codCompanhia = companhia.codCompanhia WHERE companhia.nome = 'HSBC'; 

y)
INSERT INTO pedido (codPedido, cpf, dataPedido)
SELECT 
    6,
    cliente.cpf,
    '21/09/2020'
FROM 
    cliente 
WHERE 
    cliente.nome = 'José';
    
INSERT INTO itenspedido (codItem, codPedido, codProduto, qntd) 
SELECT 1, pedido.codPedido, produto.codProduto, 3
FROM pedido, produto
WHERE produto.descricao = 'Coca-Cola' AND pedido.dataPedido = '21/09/2020';
UPDATE produto SET qntdEstoque = qntdEstoque - 3 WHERE produto.descricao = 'Coca-cola';

INSERT INTO itenspedido (codItem, codPedido, codProduto, qntd) 
SELECT 5, pedido.codPedido, produto.codProduto, 1
FROM  pedido, produto
WHERE produto.descricao = 'Suco de Uva' AND pedido.dataPedido = '21/09/2020';
UPDATE produto SET qntdEstoque = qntdEstoque - 1 WHERE produto.descrição = 'Suco de Uva';

INSERT INTO itenspedido (codItem, codPedido, codProduto, qntd) 
SELECT 6, pedido.codPedido, produto.codProduto, 2
FROM  pedido, produto
WHERE produto.descricao = 'Kinder Ovo' AND pedido.dataPedido = '21/09/2020';
UPDATE produto SET qntdEstoque = qntdEstoque - 2 WHERE produto.descrição = 'Kinder Ovo';

INSERT INTO itenspedido (codItem, codPedido, codProduto, qntd) 
SELECT 7, pedido.codPedido, produto.codProduto, 1
FROM  pedido, produto
WHERE produto.descricao = 'Suco de Maracujá' AND pedido.dataPedido = '21/09/2020';
UPDATE produto SET qntdEstoque = qntdEstoque - 1 WHERE produto.descrição = 'Suco de Maracujá';

INSERT INTO itenspedido (codItem, codPedido, codProduto, qntd) 
SELECT 8, pedido.codPedido, produto.codProduto, 6
FROM  pedido, produto
WHERE produto.descricao = 'Leite' AND pedido.dataPedido = '21/09/2020';
UPDATE produto SET qntdEstoque = qntdEstoque - 6 WHERE produto.descrição = 'Leite';

z)
INSERT INTO pedido (codPedido, cpf, dataPedido)
SELECT 
    7,
    cliente.cpf,
    '05/10/2020'
FROM 
    cliente 
WHERE 
    cliente.nome = 'Maria';

INSERT INTO itenspedido (codItem, codPedido, codProduto, qtnd) VALUES (2, 7, 2, 2);

INSERT INTO itenspedido (codItem, codPedido, codProduto, qtnd) VALUES (3, 7, 21, 12);

INSERT INTO itenspedido (codItem, codPedido, codProduto, qtnd) VALUES (4, 7, 22, 3);

UPDATE produto SET qntdEstoque = qntdEstoque - 2 WHERE produto.descricao = 'Leite';

UPDATE produto SET qntdEstoque = qntdEstoque - 12 WHERE produto.descricao = 'Ovo';

UPDATE produto SET qntdEstoque = qntdEstoque - 3 WHERE produto.descricao = 'Pão';

aa)
-- 10 CLEINTES --
INSERT INTO cliente (cpf, nome, rg, cidade) VALUES (20151170088, "Cleiton", 146934271, "Cricíuma");
INSERT INTO cliente (cpf, nome, rg, cidade) VALUES (40207515018, "Escobar", 137511024, "Rionegro");
INSERT INTO cliente (cpf, nome, rg, cidade) VALUES (92298777004, "Leandro", 223400208, "São José dos Pinhais");
INSERT INTO cliente (cpf, nome, rg, cidade) VALUES (47708434025, "Geucimar", 500120043, "Colombo");
INSERT INTO cliente (cpf, nome, rg, cidade) VALUES (11188886002, "Isa", 232890195, "Encantada");
INSERT INTO cliente (cpf, nome, rg, cidade) VALUES (42522133047, "Luciano", 322322686, "Londrina");
INSERT INTO cliente (cpf, nome, rg, cidade) VALUES (35749106063, "Kelly", 144078545, "Guarapuava");
INSERT INTO cliente (cpf, nome, rg, cidade) VALUES (13342496010, "Robson", 251891392, "São Paulo");
INSERT INTO cliente (cpf, nome, rg, cidade) VALUES (77641116000, "Roberta", 171122999, "Bahia");
INSERT INTO cliente (cpf, nome, rg, cidade) VALUES (97575903046, "Richard", 462773747, "Rio de Janeiro");

-- 20 PRODUTOS
INSERT INTO produto (codProduto, descricao, valor, qntdEstoque) VALUES ( 1,"Coca-Cola", 7, 50);
INSERT INTO produto (codProduto, descricao, valor, qntdEstoque) VALUES ( 2,"Leite" , 5, 100);
INSERT INTO produto (codProduto, descricao, valor, qntdEstoque) VALUES ( 3,"Suco de Maracujá" , 9, 2000);
INSERT INTO produto (codProduto, descricao, valor, qntdEstoque) VALUES ( 4,"Kinder Ovo", 100, 10000);
INSERT INTO produto (codProduto, descricao, valor, qntdEstoque) VALUES ( 5,"Suco de Uva", 12, 300);
INSERT INTO produto (codProduto, descricao, valor, qntdEstoque) VALUES ( 6, "Passagem" , 1500, 100);
INSERT INTO produto (codProduto, descricao, valor, qntdEstoque) VALUES ( 7, "Pacote de Dados" , 200, 200);
INSERT INTO produto (codProduto, descricao, valor, qntdEstoque) VALUES ( 8,"Empréstimo" , 600, 450);
INSERT INTO produto (codProduto, descricao, valor, qntdEstoque) VALUES ( 9, "Ações" , 1000, 120);
INSERT INTO produto (codProduto, descricao, valor, qntdEstoque) VALUES ( 10, "Pc Gamer" , 7000, 140);
INSERT INTO produto (codProduto, descricao, valor, qntdEstoque) VALUES ( 11, "Cômoda" , 400, 430);
INSERT INTO produto (codProduto, descricao, valor, qntdEstoque) VALUES ( 12, "TV" , 3000, 670);
INSERT INTO produto (codProduto, descricao, valor, qntdEstoque) VALUES ( 13, "Cama Box" , 2000, 120);
INSERT INTO produto (codProduto, descricao, valor, qntdEstoque) VALUES ( 14, "Headset" , 800, 110);
INSERT INTO produto (codProduto, descricao, valor, qntdEstoque) VALUES ( 15, "Turbina" , 50000, 20);
INSERT INTO produto (codProduto, descricao, valor, qntdEstoque) VALUES ( 16, "Hélice" , 20000, 10);
INSERT INTO produto (codProduto, descricao, valor, qntdEstoque) VALUES ( 17, "Óleo" , 40, 450);
INSERT INTO produto (codProduto, descricao, valor, qntdEstoque) VALUES ( 18, "Alcool em gel" , 10, 600);
INSERT INTO produto (codProduto, descricao, valor, qntdEstoque) VALUES ( 19, "Máscara" , 5, 4000);
INSERT INTO produto (codProduto, descricao, valor, qntdEstoque) VALUES ( 20, "Face-shield" , 15, 200);

-- CLIENTE 1 --
INSERT INTO pedido (codPedido, cpf, dataPedido)
SELECT 9, cliente.cpf, '09/11/2020'
FROM cliente 
WHERE cliente.nome = 'Leandro';
-- PEDIDOS --
INSERT INTO itenspedido (codItem, codPedido, codProduto, qntd) 
SELECT 9, pedido.codPedido, produto.codProduto, 1
FROM  pedido, produto
WHERE produto.descricao = 'Coca-Cola' AND pedido.dataPedido = '09/11/2020';
UPDATE produto SET qntdEstoque = qntdEstoque - 1 WHERE produto.descricao = 'Coca-Cola';

INSERT INTO itenspedido (codItem, codPedido, codProduto, qntd) 
SELECT 10, pedido.codPedido, produto.codProduto, 1
FROM  pedido, produto
WHERE produto.descricao = 'Ovo' AND pedido.dataPedido = '09/11/2020';
UPDATE produto SET qntdEstoque = qntdEstoque - 1 WHERE produto.descricao = 'Ovo';

INSERT INTO itenspedido (codItem, codPedido, codProduto, qntd) 
SELECT 11, pedido.codPedido, produto.codProduto, 1
FROM  pedido, produto
WHERE produto.descricao = 'Pão' AND pedido.dataPedido = '09/11/2020';
UPDATE produto SET qntdEstoque = qntdEstoque - 1 WHERE produto.descricao = 'Pão';
-- #################################################################################### --
-- Cliente 2 --
INSERT INTO pedido (codPedido, cpf, dataPedido)
SELECT 10, cliente.cpf, '08/03/2020'
FROM cliente 
WHERE cliente.nome = 'João';
-- PEDIDOS --
INSERT INTO itenspedido (codItem, codPedido, codProduto, qntd) 
SELECT 12, pedido.codPedido, produto.codProduto, 1
FROM  pedido, produto
WHERE produto.descricao = 'Pc Gamer' AND pedido.dataPedido = '08/03/2020';
UPDATE produto SET qntdEstoque = qntdEstoque - 1 WHERE produto.descricao = 'Pc Gamer';

INSERT INTO itenspedido (codItem, codPedido, codProduto, qntd) 
SELECT 13, pedido.codPedido, produto.codProduto, 1
FROM  pedido, produto
WHERE produto.descricao = 'Headset' AND pedido.dataPedido = '08/03/2020';
UPDATE produto SET qntdEstoque = qntdEstoque - 1 WHERE produto.descricao = 'Headset';

INSERT INTO itenspedido (codItem, codPedido, codProduto, qntd) 
SELECT 14, pedido.codPedido, produto.codProduto, 1
FROM  pedido, produto
WHERE produto.descricao = 'TV' AND pedido.dataPedido = '08/03/2020';
UPDATE produto SET qntdEstoque = qntdEstoque - 1 WHERE produto.descricao = 'TV';
-- #################################################################################### --
-- CLIENTE 3 --
INSERT INTO pedido (codPedido, cpf, dataPedido)
SELECT 11, cliente.cpf, '15/06/2020'
FROM cliente 
WHERE cliente.nome = 'Geucimar';
-- PEDIDO --
INSERT INTO itenspedido (codItem, codPedido, codProduto, qntd) 
SELECT 15, pedido.codPedido, produto.codProduto, 1
FROM  pedido, produto
WHERE produto.descricao = 'Cômoda' AND pedido.dataPedido = '15/06/2020';
UPDATE produto SET qntdEstoque = qntdEstoque - 1 WHERE produto.descricao = 'Cômoda';

INSERT INTO itenspedido (codItem, codPedido, codProduto, qntd) 
SELECT 16, pedido.codPedido, produto.codProduto, 1
FROM  pedido, produto
WHERE produto.descricao = 'Cama Box' AND pedido.dataPedido = '15/06/2020';
UPDATE produto SET qntdEstoque = qntdEstoque - 1 WHERE produto.descricao = 'Cama Box';

INSERT INTO itenspedido (codItem, codPedido, codProduto, qntd) 
SELECT 17, pedido.codPedido, produto.codProduto, 1
FROM  pedido, produto
WHERE produto.descricao = 'Suco de Uva' AND pedido.dataPedido = '15/06/2020';
UPDATE produto SET qntdEstoque = qntdEstoque - 1 WHERE produto.descricao = 'Suco de Uva';
-- #################################################################################### --
-- CLIENTE 4 --
INSERT INTO pedido (codPedido, cpf, dataPedido)
SELECT 12, cliente.cpf, '22/04/2020'
FROM cliente 
WHERE cliente.nome = 'Robson';
-- PEDIDO --
INSERT INTO itenspedido (codItem, codPedido, codProduto, qntd) 
SELECT 17, pedido.codPedido, produto.codProduto, 1
FROM  pedido, produto
WHERE produto.descricao = 'Suco de Uva' AND pedido.dataPedido = '15/06/2020';
UPDATE produto SET qntdEstoque = qntdEstoque - 1 WHERE produto.descricao = 'Suco de Uva';

INSERT INTO itenspedido (codItem, codPedido, codProduto, qntd) 
SELECT 17, pedido.codPedido, produto.codProduto, 1
FROM  pedido, produto
WHERE produto.descricao = 'Suco de Uva' AND pedido.dataPedido = '15/06/2020';
UPDATE produto SET qntdEstoque = qntdEstoque - 1 WHERE produto.descricao = 'Suco de Uva';

INSERT INTO itenspedido (codItem, codPedido, codProduto, qntd) 
SELECT 17, pedido.codPedido, produto.codProduto, 1
FROM  pedido, produto
WHERE produto.descricao = 'Suco de Uva' AND pedido.dataPedido = '15/06/2020';
UPDATE produto SET qntdEstoque = qntdEstoque - 1 WHERE produto.descricao = 'Suco de Uva';
-- #################################################################################### --

-- CLIENTE 5 --
INSERT INTO pedido (codPedido, cpf, dataPedido)
SELECT 13, cliente.cpf, '31/03/2020'
FROM cliente 
WHERE cliente.nome = 'Luciano';
-- PEDIDO -- 
INSERT INTO itenspedido (codItem, codPedido, codProduto, qntd) 
SELECT 18, pedido.codPedido, produto.codProduto, 1
FROM  pedido, produto
WHERE produto.descricao = 'Alcool em gel' AND pedido.dataPedido = '31/03/2020';
UPDATE produto SET qntdEstoque = qntdEstoque - 1 WHERE produto.descricao = 'Alcool em gel';

INSERT INTO itenspedido (codItem, codPedido, codProduto, qntd) 
SELECT 19, pedido.codPedido, produto.codProduto, 1
FROM  pedido, produto
WHERE produto.descricao = 'Máscara' AND pedido.dataPedido = '31/03/2020';
UPDATE produto SET qntdEstoque = qntdEstoque - 1 WHERE produto.descricao = 'Máscara';

INSERT INTO itenspedido (codItem, codPedido, codProduto, qntd) 
SELECT 20, pedido.codPedido, produto.codProduto, 1
FROM  pedido, produto
WHERE produto.descricao = 'Face-shield' AND pedido.dataPedido = '31/03/2020';
UPDATE produto SET qntdEstoque = qntdEstoque - 1 WHERE produto.descricao = 'Face-shield';
-- #################################################################################### --

bb)


cc)
SELECT cliente.Cidade AS 'Cidades', COUNT(cliente.Cidade) AS 'Pedidos'
FROM
    pedido,
    cliente
WHERE
    cliente.cpf = pedido.cpf;

dd)
SELECT sum(produto.valor) FROM produto JOIN itenspedido ON itenspedido.codProduto = produto.codProduto JOIN pedido ON itenspedido.codPedido = pedido.CodPedido JOIN cliente ON cliente.cpf = pedido.cpf WHERE cliente.nome='Maria';

ee)
SELECT  produto.descricao
FROM produto
JOIN
itenspedido 
ON itenspedido.codProduto = produto.codProduto
ORDER BY itenspedido.qntd DESC LIMIT 1;

ff)

gg)
SELECT  produto.descricao
FROM produto
JOIN
itenspedido 
ON itenspedido.codProduto = produto.codProduto
ORDER BY itenspedido.qntd ASC LIMIT 1;
    
hh)
SELECT produto.descricao FROM produto WHERE produto.qntdEstoque < 5;

ii)


jj)
SELECT cliente.nome FROM cliente 
JOIN pedido ON pedido.cpf = cliente.cpf 
JOIN itenspedido ON itenspedido.codPedido = pedido.codPedido 
JOIN produto ON produto.codProduto = itenspedido.CodProduto 
WHERE produto.descricao="Coca-Cola"  AND NOT produto.descricao="Suco de Uva";

kk)
SELECT cliente.nome FROM cliente 
JOIN pedido ON pedido.cpf = cliente.cpf 
JOIN itenspedido ON itenspedido.codPedido = pedido.codPedido 
JOIN produto ON produto.codProduto = itenspedido.CodProduto 
WHERE produto.descricao!="Leite" AND produto.descricao="Kinder Ovo" AND NOT produto.descricao!="Suco de Maracujá";

ll)
SELECT cliente.nome FROM cliente 
JOIN pedido ON pedido.cpf = cliente.cpf 
JOIN itenspedido ON itenspedido.codPedido = pedido.codPedido 
JOIN produto ON produto.codProduto = itenspedido.CodProduto 
WHERE (produto.valor*itenspedido.qntd)>="20" and produto.descricao!="Leite";

mm)
SELECT cliente.nome FROM cliente JOIN pedido ON pedido.cpf = cliente.cpf 
JOIN itenspedido ON itenspedido.codPedido = pedido.codPedido 
JOIN produto ON produto.codProduto = itenspedido.CodProduto 
WHERE produto.descricao="Coca-Cola"  AND NOT produto.descricao="Suco de Uva";