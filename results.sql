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

q)

r)

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
DELETE FROM empregado WHERE empregado.nome = 'Jesus';

y)


z)

