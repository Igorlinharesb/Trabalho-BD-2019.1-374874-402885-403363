delimiter $$;


CREATE PROCEDURE `pr_endereco_hotel`(new_nome_hotel varchar(45), new_categoria_hotel int(1), new_cidade_id int(6), new_restaurante_id int(6), new_tipo_logradouro varchar (10), new_nome_logradouro varchar (45), new_numero_end int, new_bairro varchar (45), new_cep varchar (13), new_complemento varchar(140))
begin

	declare id_novohotel int;

	insert into hotel (nome_hotel, categoria_hotel, cidade_id, restaurante_id) values (new_nome_hotel, new_categoria_hotel, new_cidade_id, new_restaurante_id);
    
    set id_novohotel = last_insert_id();
    
    insert into endereco (id_endereco, tipoendereco, tipo_logradouro, nome_logradouro, numero_end, bairro, cep, complemento)
    values (id_novohotel, 'Hotel', new_tipo_logradouro, new_nome_logradouro, new_numero_end, new_bairro, new_cep, new_complemento);
end $$;
delimiter ;
