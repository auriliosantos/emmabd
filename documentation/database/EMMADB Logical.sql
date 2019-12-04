CREATE TABLE `pessoa` (
  `id` int PRIMARY KEY auto_increment,
  `primeiro_nome` varchar(32),
  `restante_do_nome` varchar(150),
  `data_de_nascimento` date,
  `eh_masculino` boolean,
  `primeiro_nome_do_pai` varchar(32),
  `restante_do_nome_do_pai` varchar(150),
  `primeiro_nome_da_mae` varchar(32),
  `restante_do_nome_da_mae` varchar(150),
  `telefone` varchar(11),
  `telefone_extra` varchar(11),
  `cpf` varchar(11),
  `rg` int,
  `endereco` int
);

CREATE TABLE `rg` (
  `id` int PRIMARY KEY auto_increment,
  `numero` varchar(10),
  `data_de_expedicao` date,
  `orgao_expedidor` varchar(15),
  `estado` tinyint
);

CREATE TABLE `endereco` (
  `id` int PRIMARY KEY auto_increment,
  `rua` varchar(40),
  `numero` int,
  `bairro` varchar(20),
  `cidade` varchar(25),
  `estado` tinyint,
  `cep` varchar(8),
  `complemento` varchar(100)
);

CREATE TABLE `estado` (
  `id` tinyint PRIMARY KEY auto_increment,
  `estado` varchar(18),
  `uf` varchar(2)
);

CREATE TABLE `responsavel` (
  `id` int PRIMARY KEY auto_increment,
  `profissao` varchar(25),
  `endereco_do_trabalho` int,
  `formacao_academica` tinyint,
  `pessoa` int,
  `aluno` int
);

CREATE TABLE `formacao_academica` (
  `id` tinyint PRIMARY KEY auto_increment,
  `nivel` varchar(15)
);

CREATE TABLE `aluno` (
  `id` int PRIMARY KEY auto_increment,
  `cor` tinyint,
  `cidade_de_nascimento` varchar(32),
  `estado_de_nascimento` int,
  `Grupo_sanguineo` varchar(2),
  `Fator_RH` boolean,
  `tem_necessidades_especiais` boolean,
  `utiliza_transporte_escolar` boolean,
  `eh_de_area_rural` boolean,
  `NIS` int,
  `NIS_familia` int,
  `SUS` int,
  `pessoa` int,
  `certidao_de_nascimento` int
);

CREATE TABLE `cor` (
  `id` tinyint PRIMARY KEY auto_increment,
  `cor` varchar(6)
);

CREATE TABLE `certidao_de_nascimento` (
  `id` int PRIMARY KEY auto_increment,
  `numero` int,
  `nome_do_cartorio` varchar(3),
  `livro` varchar(5),
  `folhas` varchar(5),
  `cidade` varchar(32),
  `estado` int,
  `data_da_emissao` date
);

CREATE TABLE `arquivo` (
  `id` int PRIMARY KEY auto_increment,
  `letra` char,
  `pasta` int,
  `identificador` int,
  `aluno` int
);

CREATE TABLE `matricula` (
  `id` int PRIMARY KEY auto_increment,
  `data` date,
  `aluno` int,
  `turma` int
);

CREATE TABLE `turma` (
  `id` int PRIMARY KEY auto_increment,
  `serie` int,
  `turma` char,
  `ano` date
);

CREATE TABLE `caderneta` (
  `id` int PRIMARY KEY auto_increment,
  `presencas` int,
  `faltas` int,
  `mes` tinyint,
  `situacao_academica` tinyint,
  `progressao_plena` boolean,
  `materia` tinyint,
  `matricula` int
);

CREATE TABLE `situacao_academica` (
  `id` tinyint PRIMARY KEY auto_increment,
  `nome` varchar(11)
);

CREATE TABLE `mes` (
  `id` tinyint PRIMARY KEY auto_increment,
  `mes` varchar(9)
);

CREATE TABLE `materia` (
  `id` tinyint PRIMARY KEY auto_increment,
  `materia` varchar(15)
);

CREATE TABLE `nota` (
  `id` int PRIMARY KEY auto_increment,
  `periodo_de_nota` tinyint,
  `nota` int
);

CREATE TABLE `periodo_de_nota` (
  `id` tinyint PRIMARY KEY auto_increment,
  `nome` varchar(17)
);

CREATE TABLE `colaborador` (
  `id` int PRIMARY KEY auto_increment,
  `estado_civil` tinyint,
  `pasep` int,
  `email` varchar(50),
  `eh_contatado` boolean,
  `cargo` varchar(20),
  `funcao` varchar(20),
  `eh_readaptado` boolean,
  `matricula` int,
  `data_de_admissao` date,
  `observacao` varchar(100),
  `formacao_academica` tinyint,
  `habilitacao` varchar(20),
  `pessoa` int,
  `carga_horaria` int,
  `portaria` int,
  `titulo_de_eleitor` int
);

CREATE TABLE `estado_civil` (
  `id` tinyint PRIMARY KEY auto_increment,
  `estado_civil` varchar(10)
);

CREATE TABLE `carga_horaria` (
  `id` int PRIMARY KEY auto_increment,
  `valor` int,
  `tipo` varchar(2)
);

CREATE TABLE `portaria` (
  `id` int PRIMARY KEY auto_increment,
  `codigo` int,
  `data` date
);

CREATE TABLE `titulo_de_eleitor` (
  `id` int PRIMARY KEY auto_increment,
  `numero` int,
  `zona` int,
  `secao` int,
  `data_de_emissao` date
);

CREATE TABLE `usuario` (
  `id` int PRIMARY KEY auto_increment,
  `perfil_de_autorizacao` varchar(13),
  `colaborador` int
);

CREATE TABLE `transacoes` (
  `id` int PRIMARY KEY auto_increment,
  `quando` datetime,
  `alteracao` varchar(255),
  `usuario` int
);

CREATE TABLE `caderneta_nota` (
  `id` int PRIMARY KEY auto_increment,
  `caderneta` int,
  `nota` int
);

CREATE TABLE `caderneta_professor` (
  `id` int PRIMARY KEY auto_increment,
  `professor` int,
  `caderneta` int
);

ALTER TABLE `pessoa` ADD FOREIGN KEY (`rg`) REFERENCES `rg` (`id`);

ALTER TABLE `aluno` ADD FOREIGN KEY (`pessoa`) REFERENCES `pessoa` (`id`);

ALTER TABLE `colaborador` ADD FOREIGN KEY (`pessoa`) REFERENCES `pessoa` (`id`);

ALTER TABLE `pessoa` ADD FOREIGN KEY (`endereco`) REFERENCES `endereco` (`id`);

ALTER TABLE `responsavel` ADD FOREIGN KEY (`pessoa`) REFERENCES `pessoa` (`id`);

ALTER TABLE `rg` ADD FOREIGN KEY (`estado`) REFERENCES `estado` (`id`);

ALTER TABLE `endereco` ADD FOREIGN KEY (`estado`) REFERENCES `estado` (`id`);

ALTER TABLE `aluno` ADD FOREIGN KEY (`certidao_de_nascimento`) REFERENCES `certidao_de_nascimento` (`id`);

ALTER TABLE `aluno` ADD FOREIGN KEY (`cor`) REFERENCES `cor` (`id`);

ALTER TABLE `arquivo` ADD FOREIGN KEY (`aluno`) REFERENCES `aluno` (`id`);

ALTER TABLE `responsavel` ADD FOREIGN KEY (`formacao_academica`) REFERENCES `formacao_academica` (`id`);

ALTER TABLE `colaborador` ADD FOREIGN KEY (`formacao_academica`) REFERENCES `formacao_academica` (`id`);

ALTER TABLE `usuario` ADD FOREIGN KEY (`colaborador`) REFERENCES `colaborador` (`id`);

ALTER TABLE `transacoes` ADD FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`);

ALTER TABLE `matricula` ADD FOREIGN KEY (`aluno`) REFERENCES `aluno` (`id`);

ALTER TABLE `matricula` ADD FOREIGN KEY (`turma`) REFERENCES `turma` (`id`);

ALTER TABLE `caderneta` ADD FOREIGN KEY (`matricula`) REFERENCES `matricula` (`id`);

ALTER TABLE `caderneta_nota` ADD FOREIGN KEY (`nota`) REFERENCES `nota` (`id`);

ALTER TABLE `caderneta_nota` ADD FOREIGN KEY (`caderneta`) REFERENCES `caderneta` (`id`);

ALTER TABLE `caderneta` ADD FOREIGN KEY (`mes`) REFERENCES `mes` (`id`);

ALTER TABLE `caderneta` ADD FOREIGN KEY (`materia`) REFERENCES `materia` (`id`);

ALTER TABLE `colaborador` ADD FOREIGN KEY (`estado_civil`) REFERENCES `estado_civil` (`id`);

ALTER TABLE `colaborador` ADD FOREIGN KEY (`carga_horaria`) REFERENCES `carga_horaria` (`id`);

ALTER TABLE `colaborador` ADD FOREIGN KEY (`portaria`) REFERENCES `portaria` (`id`);

ALTER TABLE `colaborador` ADD FOREIGN KEY (`titulo_de_eleitor`) REFERENCES `titulo_de_eleitor` (`id`);

ALTER TABLE `responsavel` ADD FOREIGN KEY (`aluno`) REFERENCES `aluno` (`id`);

ALTER TABLE `caderneta_professor` ADD FOREIGN KEY (`caderneta`) REFERENCES `caderneta` (`id`);

ALTER TABLE `caderneta_professor` ADD FOREIGN KEY (`professor`) REFERENCES `colaborador` (`id`);

ALTER TABLE `nota` ADD FOREIGN KEY (`periodo_de_nota`) REFERENCES `periodo_de_nota` (`id`);

ALTER TABLE `caderneta` ADD FOREIGN KEY (`situacao_academica`) REFERENCES `situacao_academica` (`id`);
