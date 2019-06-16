delimiter $$;

-- DROP PROCEDURE `pr_insere_hotel`;

CREATE PROCEDURE `pr_insere_hotel`(new_nome_hotel varchar(45), new_categoria_hotel int(1), new_cidade_id int(6), new_restaurante_id int(6), new_tipo_logradouro varchar (10), new_nome_logradouro varchar (45), new_numero_end int, new_bairro varchar (45), new_cep varchar (13), new_complemento varchar(140))
begin

	declare id_novo_end int;
    
	insert into endereco (tipoendereco, tipo_logradouro, nome_logradouro, numero_end, bairro, cep, complemento)
    values ('Hotel', new_tipo_logradouro, new_nome_logradouro, new_numero_end, new_bairro, new_cep, new_complemento);
    
    set id_novo_end = last_insert_id();
    
	insert into hotel (id_hotel, nome_hotel, categoria_hotel, cidade_id, restaurante_id) values (id_novo_end, new_nome_hotel, new_categoria_hotel, new_cidade_id, new_restaurante_id);
    
end $$;
delimiter ;

delimiter $$;

DROP PROCEDURE `pr_insere_restaurante`;

CREATE PROCEDURE `pr_insere_restaurante`(new_nome_restaurante varchar(45), new_categoria_restaurante varchar (20), new_cidade_id int(6), new_tipo_logradouro varchar (10), new_nome_logradouro varchar (45), new_numero_end int, new_bairro varchar (45), new_cep varchar (13), new_complemento varchar(140))
begin

	declare id_novo_end int;
    
	insert into endereco (tipoendereco, tipo_logradouro, nome_logradouro, numero_end, bairro, cep, complemento)
    values ('Restaurante', new_tipo_logradouro, new_nome_logradouro, new_numero_end, new_bairro, new_cep, new_complemento);
    
    set id_novo_end = last_insert_id();
    
	insert into restaurante (id_restaurante, nome_restaurante, categoria_restaurante, cidade_id) values (id_novo_end, new_nome_restaurante, new_categoria_restaurante, new_cidade_id);
    
end $$;
delimiter ;


delimiter $$;

-- DROP PROCEDURE `pr_insere_igreja`;

CREATE PROCEDURE `pr_insere_igreja`(new_nome_pt varchar(45), new_descricao varchar (140), new_telefone varchar(14), new_cidade_id int (6), new_tipo_logradouro varchar (10), new_nome_logradouro varchar (45), new_numero_end int, new_bairro varchar (45), new_cep varchar (13), new_complemento varchar(140), new_data_fundacao date, new_estilo varchar (45))
begin

	declare id_novo_end int;
    
	insert into endereco (tipoendereco, tipo_logradouro, nome_logradouro, numero_end, bairro, cep, complemento)
    values ('PontoTuristico', new_tipo_logradouro, new_nome_logradouro, new_numero_end, new_bairro, new_cep, new_complemento);
    
    set id_novo_end = last_insert_id();
    
	insert into ponto_turistico (id_pt, nome_pt, descricao, telefone, tipo_pt, cidade_id) values (id_novo_end,new_nome_pt, new_descricao, new_telefone, 'Igreja', new_cidade_id);
    
    insert into igreja (pt_id, data_fundacao, estilo) values (id_novo_end, new_data_fundacao, new_estilo);
	
end $$;
delimiter ;