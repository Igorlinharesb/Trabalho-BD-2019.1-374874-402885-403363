-- Modelos de buscas --

-- 1 - Dado nome de uma cidade, deseja-se saber:
	-- 1.1 - Quais os pontos turísticos e seus endereços
		select pt.nome 'Ponto Turístico', c.nome 'Cidade', c.uf 'UF', e.Tipo_Logradouro 'Tipo de Logradouro', 
        e.Nome 'Nome Logradouro', e.Numero 'Número', e.bairro 'Bairro', e.cep 'CEP', e.Complemento 'Complemento'
        from (ponto_turistico pt inner join endereco e on e.ID_Endereco = pt.ID_PT) inner join cidade c on c.ID_Cidade = pt.Cidade_ID
        where c.nome = 'Rio de Janeiro'; -- Altera o o nome da cidade

	-- 1.2 - Quais as igrejas e museus mais antigos com fundadores nacionais;
		select pt.Nome
        from (museu m inner join ponto_turistico pt on m.PT_ID = pt.ID_PT) ; 
        
	-- 1.3 - Quais são as casas de show que estão abertas em um determinado dia da semana funcionando a partir de um determinado horário;
		select pt.Nome 'Casa de Show', cs.Especialidade_Rest 'Especialidade do Restaurante', cs.Preco_Medio_Rest 'Preço Médio do Restaurante'
        from (casa_de_show cs  inner join ponto_turistico pt on cs.PT_ID = pt.ID_PT) inner join  cidade c on pt.Cidade_ID = c.ID_Cidade
        where Dia_de_Fechamento != 'Terça-Feira' and Horario_Inicio >= '22:00';
	
    -- 1.4 - Quais os melhores hotéis (acima de 3 estrelas) que possuem restaurante aberto nos 3 próximos dias.
		