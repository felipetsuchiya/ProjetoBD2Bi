CREATE TABLE `cliente` (
  `cpf` int NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `rg` int DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`),
  UNIQUE KEY `rg_UNIQUE` (`rg`));
  
   CREATE TABLE `empregado` (
  `CodEmpregado` int NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `rua` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CodEmpregado`)); 
  
  CREATE TABLE `companhia` (
  `CodCompanhia` int NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CodCompanhia`));
    
  CREATE TABLE `gerente` (
  `codEmpregado` int NOT NULL,
  `codGerente` int NOT NULL,
  KEY `fk_codEmpregado_gerente` (`codEmpregado`),
  CONSTRAINT `fk_codEmpregado_gerente` FOREIGN KEY (`codEmpregado`) REFERENCES `empregado` (`CodEmpregado`));
  cliente
  CREATE TABLE `pedido` (
  `codPedido` int NOT NULL,
  `codCliente` int DEFAULT NULL,
  `dataPedido` int DEFAULT NULL,
  PRIMARY KEY (`codPedido`),
  UNIQUE KEY `codCliente_UNIQUE` (`codCliente`));
  
  CREATE TABLE `produto` (
  `codProduto` int NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `valor` int DEFAULT NULL,
  `qntdEstoque` int DEFAULT NULL,
  PRIMARY KEY (`codProduto`),
  UNIQUE KEY `codProduto_UNIQUE` (`codProduto`));
  
  CREATE TABLE `trabalha` (
  `salario` int NOT NULL,
  `codEmpregado` int DEFAULT NULL,
  `codCompanhia` int DEFAULT NULL,
  KEY `fk_codEmpregado_idx` (`codEmpregado`),
  KEY `fk_codCompanhia_idx` (`codCompanhia`),
  CONSTRAINT `fk_codCompanhia_trabalha` FOREIGN KEY (`codCompanhia`) REFERENCES `companhia` (`CodCompanhia`),
  CONSTRAINT `fk_codEmpregado_trabalha` FOREIGN KEY (`codEmpregado`) REFERENCES `empregado` (`CodEmpregado`));
  
  CREATE TABLE `itenspedido` (
  `codItem` int DEFAULT NULL,
  `codPedido` int NOT NULL,
  `codProduto` int NOT NULL,
  `qntd` int DEFAULT NULL,
  UNIQUE KEY `codItem_UNIQUE` (`codItem`),
  KEY `fk_codProduto_idx` (`codProduto`),
  KEY `fk_codPedido_idx` (`codPedido`),
  CONSTRAINT `fk_codPedido` FOREIGN KEY (`codPedido`) REFERENCES `pedido` (`codPedido`),
  CONSTRAINT `fk_codProduto` FOREIGN KEY (`codProduto`) REFERENCES `produto` (`codProduto`));

  
  
 
  
  
  