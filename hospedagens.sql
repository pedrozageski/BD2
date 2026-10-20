-- ============================================================
-- Banco de dados de hospedagens e aluguéis
-- Tabelas: clientes, hospedagens, alugueis
-- Compatível com MySQL 8+
-- ============================================================

-- Se quiser recriar as tabelas do zero, descomente as linhas abaixo.
-- Atenção: isso apaga os dados que já existirem.
-- DROP TABLE IF EXISTS alugueis;
-- DROP TABLE IF EXISTS hospedagens;
-- DROP TABLE IF EXISTS clientes;


-- Quem aluga o imóvel
CREATE TABLE IF NOT EXISTS clientes (
    id_cliente  INT AUTO_INCREMENT PRIMARY KEY,
    nome        VARCHAR(100) NOT NULL,
    email       VARCHAR(150) UNIQUE,
    telefone    VARCHAR(20)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;


-- Os imóveis disponíveis para aluguel
CREATE TABLE IF NOT EXISTS hospedagens (
    id_hospedagem   INT AUTO_INCREMENT PRIMARY KEY,
    tipo            VARCHAR(50),
    endereco        VARCHAR(255),
    capacidade      INT,
    valor_diaria    DECIMAL(10, 2)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;


-- Cada reserva/aluguel liga um cliente a uma hospedagem
CREATE TABLE IF NOT EXISTS alugueis (
    id_aluguel      INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente      INT NOT NULL,
    id_hospedagem   INT NOT NULL,
    data_inicio     DATE,
    data_fim        DATE,
    valor_total     DECIMAL(10, 2),
    status          VARCHAR(30),

    CONSTRAINT fk_alugueis_cliente
        FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente),

    CONSTRAINT fk_alugueis_hospedagem
        FOREIGN KEY (id_hospedagem) REFERENCES hospedagens (id_hospedagem)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;
