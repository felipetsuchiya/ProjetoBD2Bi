a)
SELECT empregado.nome FROM empregado  JOIN trabalha ON trabalha.codEmpregado = empregado.codEmpregado JOIN companhia ON companhia.codCompanhia = trabalha.codCompanhia WHERE companhia.nome="Casas Bahia";

b)
SELECT empregado.nome, empregado.cidade FROM empregado  JOIN trabalha ON trabalha.codEmpregado = empregado.codEmpregado JOIN companhia ON companhia.codCompanhia = trabalha.codCompanhia WHERE companhia.nome="GVT";

c)
SELECT empregado.nome, empregado.cidade, empregado.rua FROM empregado  JOIN trabalha ON trabalha.codEmpregado = empregado.codEmpregado JOIN companhia ON companhia.codCompanhia = trabalha.codCompanhia WHERE companhia.nome="TIM" AND trabalha.salario >= 3000;

d)
SELECT empregado.nome, companhia.nome FROM empregado  JOIN trabalha ON trabalha.codEmpregado = empregado.codEmpregado JOIN companhia ON companhia.codCompanhia = trabalha.codCompanhia WHERE companhia.nome!="Casas Bahia";

e)
SELECT empregado.nome FROM empregado  JOIN trabalha ON trabalha.codEmpregado = empregado.codEmpregado JOIN companhia ON companhia.codCompanhia = trabalha.codCompanhia WHERE companhia.nome!="TIM" and trabalha.salario >= 5000;

f)
SELECT empregado.nome FROM ( select empregado.nome, empregado.CodEmpregado from empregado 
    JOIN trabalha ON empregado.codEmpregado = trabalha.codEmpregado 
    JOIN companhia ON companhia.codCompanhia = trabalha.codCompanhia 
    AND companhia.nome='GVT'
    JOIN gerente ON gerente.codEmpregado = empregado.codEmpregado) t1
    JOIN empregado ON empregado.nome = t1.nome AND empregado.codEmpregado != t1.codEmpregado;

g)
SELECT * FROM companhia WHERE companhia.cidade = "Cianorte" ;

j)
SELECT empregado.nome FROM empregado
 JOIN trabalha ON trabalha.CodEmpregado = empregado.CodEmpregado 
 JOIN companhia ON companhia.CodCompanhia = trabalha.CodCompanhia
 WHERE empregado.cidade = companhia.cidade;


h)


n)
SELECT empregado.nome FROM empregado  JOIN trabalha ON trabalha.codEmpregado = empregado.codEmpregado JOIN companhia ON companhia.codCompanhia = trabalha.codCompanhia WHERE companhia.nome="TAM" AND empregado.cidade!="São Paulo";

o)
SELECT empregado.nome FROM empregado  JOIN trabalha ON trabalha.codEmpregado = empregado.codEmpregado JOIN companhia ON companhia.codCompanhia = trabalha.codCompanhia WHERE companhia.nome="TAM" AND empregado.cidade="Maceió";

t)
SET SQL_SAFE_UPDATES = 0;
UPDATE empregado SET cidade = 'Brasilia' WHERE nome = 'José';

u) 
SELECT empregado.nome, trabalha.salario*0.1+trabalha.salario FROM empregado JOIN trabalha ON  trabalha.codEmpregado = empregado.codEmpregado JOIN companhia ON companhia.codCompanhia = trabalha.codCompanhia WHERE companhia.nome="Varig";
    
v)
select empregado.nome, trabalha.salario*0.03+trabalha.salario from empregado 
JOIN trabalha ON empregado.codEmpregado = trabalha.codEmpregado 
JOIN companhia ON companhia.codCompanhia = trabalha.codCompanhia
JOIN gerente ON gerente.codEmpregado = empregado.codEmpregado;

w)
select trabalha.codEmpregado, trabalha.salario*0.07+trabalha.salario from trabalha join gerente on gerente.codEmpregado = trabalha.codEmpregado WHERE trabalha.salario>=1200;
select trabalha.codEmpregado, trabalha.salario*0.10+trabalha.salario from trabalha join gerente on gerente.codEmpregado != trabalha.codEmpregado WHERE trabalha.salario<=1200;