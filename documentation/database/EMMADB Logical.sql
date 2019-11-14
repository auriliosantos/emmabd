CREATE TABLE `pessoa` (
  `id` int PRIMARY KEY,
  `primeiro_nome` varchar(32),
  `restante_do_nome` varchar(150),
  `data_de_nascimento` date,
  `eh_masculino` boolean,
  `primeiro_nome_do_pai` varchar(32),
  `restante_do_nome_do_pai` varchar(150),
  `primeiro_nome_da_mae` varchar(32),
  `restante_do_nome_da_mae` varchar(150),
  `telefone` int,
  `telefone_extra` int,
  `cpf` int,
  `rg` int,
  `endereco` int
);

CREATE TABLE `rg` (
  `id` int PRIMARY KEY,
  `numero` int,
  `data_de_expedicao` date,
  `orgao_expedidor` varchar(15),
  `estado` tinyint
);

CREATE TABLE `endereco` (
  `id` int PRIMARY KEY,
  `rua` varchar(40),
  `numero` int,
  `bairro` varchar(20),
  `cidade` varchar(25),
  `estado` tinyint,
  `cep` int,
  `complemento` varchar(100)
);

CREATE TABLE `estado` (
  `id` tinyint PRIMARY KEY,
  `estado` varchar(18),
  `uf` char(2)
);

CREATE TABLE `responsavel` (
  `id` int PRIMARY KEY,
  `profissao` varchar(25),
  `endereco_do_trabalho` int,
  `formacao_academica` tinyint,
  `pessoa` int,
  `aluno` int
);

CREATE TABLE `formacao_academica` (
  `id` tinyint PRIMARY KEY,
  `nivel` varchar(15)
);

CREATE TABLE `aluno` (
  `id` int PRIMARY KEY,
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
  `id` tinyint PRIMARY KEY,
  `cor` varchar(6)
);

CREATE TABLE `certidao_de_nascimento` (
  `id` int PRIMARY KEY,
  `numero` int,
  `nome_do_cartorio` varchar(50),
  `livro` varchar(20),
  `folhas` varchar(20),
  `cidade` varchar(32),
  `estado` int,
  `data_da_emissao` date
);

CREATE TABLE `arquivo` (
  `id` int PRIMARY KEY,
  `letra` char,
  `pasta` int,
  `identificador` int,
  `aluno` int
);

CREATE TABLE `matricula` (
  `id` int PRIMARY KEY,
  `data` date,
  `aluno` int,
  `turma` int
);

CREATE TABLE `turma` (
  `id` int PRIMARY KEY,
  `serie` int,
  `turma` char,
  `ano` date
);

CREATE TABLE `caderneta` (
  `id` int PRIMARY KEY,
  `presencas` int,
  `faltas` int,
  `mes` tinyint,
  `situacao_academica` varchar(20),
  `progressao` varchar(30),
  `materia` tinyint,
  `matricula` int
);

CREATE TABLE `mes` (
  `id` tinyint PRIMARY KEY,
  `mes` varchar(20)
);

CREATE TABLE `materia` (
  `id` tinyint PRIMARY KEY,
  `materia` varchar(20)
);

CREATE TABLE `nota` (
  `id` int PRIMARY KEY,
  `periodo` varchar(20),
  `nota` int
);

CREATE TABLE `colaborador` (
  `id` int PRIMARY KEY,
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
  `id` tinyint PRIMARY KEY,
  `estado_civil` varchar(20)
);

CREATE TABLE `carga_horaria` (
  `id` int PRIMARY KEY,
  `valor` int,
  `tipo` varchar(5)
);

CREATE TABLE `portaria` (
  `id` int PRIMARY KEY,
  `codigo` int,
  `data` datetime
);

CREATE TABLE `titulo_de_eleitor` (
  `id` int PRIMARY KEY,
  `numero` int,
  `zona` int,
  `secao` int,
  `data_de_emissao` date
);

CREATE TABLE `usuario` (
  `id` int PRIMARY KEY,
  `perfil_de_autorizacao` varchar(20),
  `colaborador` int
);

CREATE TABLE `transacoes` (
  `id` int PRIMARY KEY,
  `quando` datetime,
  `alteracao` varchar(255),
  `usuario` int
);

CREATE TABLE `caderneta_nota` (
  `id` int PRIMARY KEY,
  `caderneta` int,
  `nota` int
);

CREATE TABLE `caderneta_professor` (
  `id` int PRIMARY KEY,
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
