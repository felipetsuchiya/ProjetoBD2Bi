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

g)
SELECT * FROM companhia WHERE companhia.cidade = "Cianorte" ;

h)