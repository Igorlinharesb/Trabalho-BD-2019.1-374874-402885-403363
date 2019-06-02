-- Modelos de buscas --

-- 1 - Dado nome de uma cidade, deseja-se saber:
	-- 1.1 - Quais os pontos turísticos e seus endereços
		select c.nome, c.uf, pt.nome, e.Tipo_Logradouro, e.Nome, e.Numero, e.bairro, e.cep, e.Complemento
        from ponto_turistico pt, cidade c, endereco e 
        where Cidade_ID = ID_Cidade and  ID_Endereco = ID_PT and c.nome = 'rio de janeiro'; -- Alterao o nome da cidade
        