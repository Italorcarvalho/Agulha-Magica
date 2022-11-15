-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15-Nov-2022 às 18:48
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ecommerce`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `carrinho`
--

CREATE TABLE `carrinho` (
  `id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `qnt` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `carrinho`
--

INSERT INTO `carrinho` (`id`, `produto_id`, `qnt`, `created`, `usuario_id`) VALUES
(214, 42, 1, '2022-11-12 21:21:29', 59);

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nome` varchar(120) COLLATE utf32_swedish_ci NOT NULL,
  `descricao` varchar(120) COLLATE utf32_swedish_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `modified` datetime DEFAULT NULL,
  `icone` varchar(50) COLLATE utf32_swedish_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf32 COLLATE=utf32_swedish_ci;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`id`, `nome`, `descricao`, `created`, `modified`, `icone`) VALUES
(1, 'Bolsas e Carteiras', 'Categoria destinada a bolsas e carteiras', '2021-06-18 20:32:53', NULL, 'fa fa-shopping-bag'),
(2, 'Decoração', 'Categoria destinada a decorações em geral', '2021-06-18 20:32:54', NULL, 'fa fa-object-group'),
(3, 'Acessórios', 'Categoria destinada a acessórios em geral', '2021-06-18 20:32:54', NULL, 'fa fa-star'),
(4, 'Lembrancinhas', 'Categoria destinada a lembrancinhas em geral', '2021-06-18 20:32:54', NULL, 'fa fa-gift'),
(5, 'Bijuterias', 'Categoria destinada a bijuterias em geral', '2021-06-18 20:32:54', NULL, 'fa fa-circle'),
(6, 'Crochê', 'Categoria destinada a produtos feitos em crochê', '2021-06-18 20:32:54', NULL, 'fa fa-magic'),
(7, 'Roupas', 'Categoria destinada a roupas personalizadas e afins', '2021-06-18 20:32:54', NULL, 'fa fa-tshirt');

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco`
--

CREATE TABLE `endereco` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `cep` varchar(9) COLLATE utf32_swedish_ci NOT NULL,
  `endereco` varchar(255) COLLATE utf32_swedish_ci NOT NULL,
  `numero` mediumint(11) NOT NULL,
  `complemento` varchar(255) COLLATE utf32_swedish_ci DEFAULT NULL,
  `bairro` varchar(255) COLLATE utf32_swedish_ci NOT NULL,
  `cidade` varchar(255) COLLATE utf32_swedish_ci NOT NULL,
  `estado` varchar(255) COLLATE utf32_swedish_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf32 COLLATE=utf32_swedish_ci;

--
-- Extraindo dados da tabela `endereco`
--

INSERT INTO `endereco` (`id`, `usuario_id`, `cep`, `endereco`, `numero`, `complemento`, `bairro`, `cidade`, `estado`, `created`, `modified`) VALUES
(35, 60, '72215-083', 'QNM 7 Conjunto M', 5, 'Casa', 'Ceilândia Sul (Ceilândia)', 'Brasília', 'DF', '2022-11-12 21:33:01', NULL),
(34, 59, '72215-083', 'QNM 7 Conjunto M', 5, 'Casa', 'Ceilândia Sul (Ceilândia)', 'Brasília', 'DF', '2022-11-12 21:19:34', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_pedido`
--

CREATE TABLE `item_pedido` (
  `pedido_id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `qnt` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf32 COLLATE=utf32_swedish_ci;

--
-- Extraindo dados da tabela `item_pedido`
--

INSERT INTO `item_pedido` (`pedido_id`, `produto_id`, `qnt`) VALUES
(1, 29, 2),
(1, 37, 1),
(1, 13, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `lista_desejo`
--

CREATE TABLE `lista_desejo` (
  `id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf32 COLLATE=utf32_swedish_ci;

--
-- Extraindo dados da tabela `lista_desejo`
--

INSERT INTO `lista_desejo` (`id`, `produto_id`, `usuario_id`, `created`, `modified`) VALUES
(79, 27, 59, '2022-11-12 21:20:46', NULL),
(77, 40, 59, '2022-11-12 21:20:24', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `status` enum('Created','Expired','Analysis','Paid','Completed','Refunded','Chargeback') COLLATE utf32_swedish_ci NOT NULL DEFAULT 'Created',
  `total` double NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `modified` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf32 COLLATE=utf32_swedish_ci;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`id`, `usuario_id`, `status`, `total`, `created`, `modified`) VALUES
(1, 60, 'Created', 84.96, '2022-11-12 21:36:47', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `nome` varchar(120) COLLATE utf32_swedish_ci NOT NULL,
  `descricao` varchar(255) COLLATE utf32_swedish_ci NOT NULL,
  `estoque` int(11) NOT NULL,
  `preco` double NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `modified` datetime DEFAULT NULL,
  `img` varchar(255) COLLATE utf32_swedish_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf32 COLLATE=utf32_swedish_ci;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`id`, `categoria_id`, `nome`, `descricao`, `estoque`, `preco`, `created`, `modified`, `img`) VALUES
(40, 7, 'Camiseta dia das mães', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 30, 37.99, '2021-06-19 20:45:28', NULL, 'img/produtos/camiseta-dia-das-maes.jpg'),
(39, 7, 'Camiseta tie dyea', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 15, 34.95, '2021-06-19 20:45:19', NULL, 'img/produtos/camiseta-tie-dye.jpg'),
(38, 7, 'Camiseta personalizada', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 10, 20.95, '2021-06-19 20:45:10', NULL, 'img/produtos/camiseta-personalizada.jpg'),
(37, 6, 'Sousplat de Crochê', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 23, 14.99, '2021-06-19 20:44:45', NULL, 'img/produtos/sousplat-de-croche.jpg'),
(36, 6, 'Tapete em crochê', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 17, 54.95, '2021-06-19 20:44:32', NULL, 'img/produtos/tapete-em-croche.jpg'),
(35, 6, 'Xicara amigurumi', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 30, 80.93, '2021-06-19 20:44:20', NULL, 'img/produtos/xicara-amigurumi.jpg'),
(34, 6, 'Cavalo amigurumi', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 30, 89.95, '2021-06-19 20:43:50', NULL, 'img/produtos/cavalo-amigurumi.jpg'),
(33, 6, 'Leao amigurumi', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 30, 92.99, '2021-06-19 20:43:39', NULL, 'img/produtos/leao-amigurumi.jpg'),
(32, 6, 'Bomba amigurumi', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 30, 99.95, '2021-06-19 20:43:27', NULL, 'img/produtos/bomba-amigurumi.jpg'),
(31, 5, 'Piercing cartilagem', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 10, 15.99, '2021-06-19 20:42:46', NULL, 'img/produtos/piercing-argola.jpg'),
(30, 5, 'Pulseiras magneticas', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 18, 23.42, '2021-06-19 20:42:32', NULL, 'img/produtos/pulseiras-magneticas.jpg'),
(29, 5, 'Colar de girassol', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 27, 19.99, '2021-06-19 20:42:23', NULL, 'img/produtos/colar-de-girassol.jpg'),
(28, 5, 'Colar de pérola', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 33, 29.99, '2021-06-19 20:42:13', NULL, 'img/produtos/colar-personalizado.jpg'),
(27, 5, 'Colar com cruz', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 37, 25.99, '2021-06-19 20:42:01', NULL, 'img/produtos/colar-cruz.jpg'),
(26, 5, 'Pulseira sistema solar', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 30, 22.99, '2021-06-19 20:41:49', NULL, 'img/produtos/pulseira-sistema-solar.jpg'),
(25, 4, 'Canecas personalizadas', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 29, 20.99, '2021-06-19 20:41:26', NULL, 'img/produtos/canecas personalizadas.jpg'),
(24, 4, 'Copos personalizados', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 33, 17.15, '2021-06-19 20:41:15', NULL, 'img/produtos/copos-personalizados.jpg'),
(23, 4, 'Taça personalizada', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 35, 9.99, '2021-06-19 20:40:52', NULL, 'img/produtos/taca-personalizada.jpg'),
(22, 4, 'Chinelo personalizado', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 38, 20.99, '2021-06-19 20:40:41', NULL, 'img/produtos/chinelo-personalizado.jpg'),
(21, 4, 'Lembrança chá de bebê', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 45, 20.55, '2021-06-19 20:40:32', NULL, 'img/produtos/lembrancinhas-cha-de-bebe.jpg'),
(20, 4, 'Nossa senhora aparecida', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 30, 25.55, '2021-06-19 20:40:19', NULL, 'img/produtos/nossa-senhora-aparecida-em-MDF.jpg'),
(19, 3, 'Abridores personalizados', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 38, 2.15, '2021-06-19 18:30:31', NULL, 'img/produtos/abridor-personalizado.jpg'),
(18, 3, 'Tiara de luxo', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 27, 31.49, '2021-06-19 18:30:13', NULL, 'img/produtos/tiara-de-luxo.jpg'),
(17, 3, 'Tornozeleira de búzio', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 20, 18.99, '2021-06-19 18:29:53', NULL, 'img/produtos/tornozeleira-de-buzio.jpg'),
(16, 3, 'Cordão personalizado', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 30, 24.99, '2021-06-19 18:29:38', NULL, 'img/produtos/cordao-personalizado.png'),
(15, 3, 'Pulseira madrinha', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 30, 58.99, '2021-06-19 18:29:25', NULL, 'img/produtos/pulseira-madrinha.jpg'),
(14, 3, 'Mascara personalizada', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 38, 4.99, '2021-06-19 18:29:10', NULL, 'img/produtos/mascara-personalizada.jpg'),
(13, 2, 'Quadro Decorativo CAT', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 23, 29.99, '2021-06-19 17:57:58', NULL, 'img/produtos/quadro-gatinho.jpg'),
(12, 2, 'Enfeite de árvore de natal', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 18, 65.99, '2021-06-19 17:57:39', NULL, 'img/produtos/enfeite-de-arvore-de-natal.jpg'),
(11, 2, 'Quadro Decorativo CAFÉ', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 15, 27.43, '2021-06-19 17:57:00', NULL, 'img/produtos/quadro-decorativo-cafe.jpg'),
(10, 2, 'Nichos em MDF branco', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 50, 56.99, '2021-06-19 17:56:40', NULL, 'img/produtos/nichos-em-mdf.jpg'),
(9, 2, 'Nomes em MDF', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 25, 9.99, '2021-06-19 17:56:18', NULL, 'img/produtos/nomes-em-mdf.jpg'),
(8, 2, 'Tapete personalizado', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 38, 92.99, '2021-06-19 17:55:52', NULL, 'img/produtos/tapete-capacho-personalizado.jpg'),
(7, 1, 'Carteira em tecido', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 30, 59.99, '2021-06-19 17:22:27', NULL, 'img/produtos/carteira-em-tecido-personalizada.jpg'),
(6, 1, 'Carteira multiuso', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 37, 32.99, '2021-06-19 17:21:50', NULL, 'img/produtos/carteira-multiuso.jpg'),
(5, 1, 'Carteira porta celular', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 50, 32.99, '2021-06-19 17:21:22', NULL, 'img/produtos/carteira-porta-celular-personalizada.jpg'),
(4, 1, 'Bolsa clutch em crochê', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 20, 79.99, '2021-06-19 17:20:47', NULL, 'img/produtos/bolsa-clutch-em-croche.jpg'),
(2, 1, 'Bolsa de palha', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 15, 49.99, '2021-06-19 17:15:00', NULL, 'img/produtos/bolsa-de-palha.jpg'),
(3, 1, 'Bolsa ecobag', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 35, 10.99, '2021-06-19 17:20:13', NULL, 'img/produtos/bolsa-ecobag-personalizada.jpg'),
(41, 7, 'Camiseta Frida Kahlo', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 20, 39.99, '2021-06-19 20:45:36', NULL, 'img/produtos/camiseta-frida-kahlo.jpg'),
(42, 7, 'Camisa Will Smith', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 45, 46.39, '2021-06-19 20:45:47', NULL, 'img/produtos/camisa-will-smith.jpg'),
(43, 7, 'Short de croche', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in', 23, 75.61, '2021-06-19 20:45:58', '2022-10-21 01:12:26', 'img/produtos/short-de-croche.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(120) COLLATE utf32_swedish_ci NOT NULL,
  `email` varchar(255) COLLATE utf32_swedish_ci NOT NULL,
  `cpf` varchar(14) COLLATE utf32_swedish_ci NOT NULL,
  `telefone` varchar(14) COLLATE utf32_swedish_ci NOT NULL,
  `nascimeto` date NOT NULL,
  `sex` enum('M','F','U') COLLATE utf32_swedish_ci NOT NULL DEFAULT 'U',
  `senha` varchar(255) COLLATE utf32_swedish_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `modified` datetime DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf32 COLLATE=utf32_swedish_ci;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `email`, `cpf`, `telefone`, `nascimeto`, `sex`, `senha`, `created`, `modified`, `admin`) VALUES
(23, 'Admin', 'admin', '055.811.663-77', '(33) 7777-7766', '1997-02-14', 'M', 'admin', '2021-06-21 21:25:45', '2021-06-21 21:30:20', 1),
(60, 'Italo Rosa', 'italorcarvalho@hotmail.com', '050.930.841-33', '(61) 9910-3553', '1997-07-12', 'M', '1234', '2022-11-12 21:31:29', '2022-11-12 21:33:23', 0),
(59, 'Italo Rosa', 'italorcarvalho@gmail.com', '050.930.841-31', '(61) 9910-3553', '1991-07-12', 'M', '1234', '2022-11-12 21:18:13', '2022-11-12 21:19:56', 0);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `carrinho`
--
ALTER TABLE `carrinho`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices para tabela `item_pedido`
--
ALTER TABLE `item_pedido`
  ADD PRIMARY KEY (`pedido_id`,`produto_id`);

--
-- Índices para tabela `lista_desejo`
--
ALTER TABLE `lista_desejo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produto_id` (`produto_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices para tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `carrinho`
--
ALTER TABLE `carrinho`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de tabela `lista_desejo`
--
ALTER TABLE `lista_desejo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
