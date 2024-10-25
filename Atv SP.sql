CREATE DATABASE atv_25_10;

create table tbl_clientes (
	id int not null primary key auto_increment,
    nome varchar(40) not null,
    idade int not null,
    sexo char(1) not null,
    email varchar(100) not null,
    telefone varchar(15) not null,
    endereco varchar(255) not null
);

INSERT INTO tbl_clientes (nome, idade, sexo, email, telefone, endereco)
VALUES
('Yuri Alberto', 27, 'M', 'yuri.alberto@gmail.com', '11987654321', 'São Paulo, SP'),
('Renato Augusto', 35, 'M', 'renato.augusto@hotmail.com', '21987654321', 'Rio de Janeiro, RJ'),
('Coronado', 29, 'M', 'coronado@gmail.com', '11976543210', 'Campinas, SP'),
('Memphis Depay', 30, 'M', 'memphis.depay@gmail.com', '21976543210', 'Niterói, RJ'),
('Julio', 40, 'M', 'julio@gmail.com', '11965432109', 'São Bernardo do Campo, SP'),
('Renatinho', 10, 'M', 'renatinho@gmail.com', '15991320912', 'Itapetininga, SP');



DELIMITER $$
CREATE PROCEDURE sp_lista_clientes(IN maior INT)
BEGIN
	IF maior = 0 then
		SELECT * FROM tbl_clientes WHERE idade >= 18;
	ELSEIF maior = 1 then
		SELECT * FROM tbl_clientes WHERE idade < 18;
	ELSE
		SELECT * FROM tbl_clientes;
	END IF;
END $$
DELIMITER ;

SHOW PROCEDURE STATUS;

#Lista idade maior:
CALL sp_lista_clientes(0);
#Lista idade menor;
	CALL sp_lista_clientes(1);
#Lista todos;
CALL sp_lista_clientes(2);

