create database bd_clientes;

create table tbl_clientes (
	codigo int not null primary key auto_increment,
    nome varchar(40) not null,
    sexo char(1) not null
);

insert into tbl_clientes(nome,sexo)
values("Yuri Alberto","M"),("Memphis Depay","M"),("Igor Coronado","M");

select * from tbl_clientes;




DELIMITER $$
CREATE PROCEDURE sp_lista_clientes(IN opcao INT)
BEGIN
	IF opcao = 0 then
		SELECT * FROM tbl_clientes WHERE sexo = 'F';
	ELSEIF opcao = 1 then
		SELECT * FROM tbl_clientes WHERE sexo = 'M';
	ELSE
		SELECT * FROM tbl_clientes;
	END IF;
END $$
DELIMITER ;

SHOW PROCEDURE STATUS;

#Lista sexo feminino:
CALL sp_lista_clientes(0);
#Lista sexo masculino;
CALL sp_lista_clientes(1);
#Lista todos;
CALL sp_lista_clientes(2);




#EXEMPLO 2
DELIMITER $$
CREATE PROCEDURE sp_busca_cliente_por_nome(IN nome_parcial VARCHAR(100))
BEGIN
	SELECT * FROM tbl_clientes
    where nome LIKE CONCAT('%', nome_parcial, '%');
END $$

DELIMITER ;

CALL sp_busca_cliente_por_nome("Yuri")
    




