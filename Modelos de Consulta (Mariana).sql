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
    
    -- 3. Dada uma nacionalidade de um fundador, deseja-se saber:
    -- 3.1- Os nomes, endereços e cidades que possuem museus e igrejas fundados por nativos daquela
    -- nação;
        
        select ptt.Nome 'Ponto Turístico', cc.Nome 'Cidade', cc.UF 'UF', ee.Tipo_Logradouro 'Tipo de Logradouro', 
        ee.Nome 'Nome Logradouro', ee.Numero 'Número', ee.Bairro 'Bairro', ee.CEP 'CEP', ee.Complemento 'Complemento'        
		from ((((igreja i inner join Igreja_has_Fundador h on i.PT_ID = h.Igreja_ID) inner join fundador f on 
        h.Fundador_ID = f.ID) inner join ponto_turistico pt on i.PT_ID = pt.ID_PT) inner join endereco e on 
        e.ID_Endereco = pt.ID_PT) inner join  cidade c on pt.Cidade_ID = c.ID_Cidade, ((((museu m inner join 
        museu_has_fundador hh on m.PT_ID = hh.Museu_ID) inner join fundador ff on hh.Fundador_ID = ff.ID) inner join 
        ponto_turistico ptt on m.PT_ID = ptt.ID_PT) inner join endereco ee on ee.ID_Endereco = ptt.ID_PT) inner join  
        cidade cc on ptt.Cidade_ID = cc.ID_Cidade
		where ff.Nome = 'Fundação Roberto Marinho' and ff.Nacionalidade = 'Brasileira'
        group by ptt.nome;
        
    -- 3.2- Qual(is) a(s) cidade(s) que possue(m) museus e igrejas fundados mais recentemente por nativos
    -- daquela nação com uma população entre X e Y habitantes;
		select pt.nome 'Ponto Turístico', c.populacao 'População'
        from  (((igreja i inner join igreja_has_fundador s on i.PT_ID = s.igreja_ID) inner join
        (museu m inner join museu_has_fundador h on m.PT_ID = h.Museu_ID) inner join fundador f on 
		s.Fundador_ID and h.Fundador_ID = f.ID) inner join ponto_turistico pt on i.PT_ID and m.PT_ID = pt.ID_PT) 
		inner join cidade c on pt.Cidade_ID = c.ID_Cidade
		where c.nome = 'Sobral' and f.nacionalidade = 'Brasileira' and c.populacao >= '100000' and c.populacao <= '200000'
        group by pt.nome;
        
    -- 3.3- Quais as igrejas de certo estilo (p. ex.: “Art Nouveau”) fundadas por nativos daquela nação em
    -- um determinado período (p. ex: Século XIX).
		select pt.Nome 'Ponto Turístico', pt.Tipo 'Tipo', i.Estilo 'Estilo', i.Data_Funcadacao 'Data de Fundação',
		f.nome 'Nome do Fundador', f.nacionalidade 'Nacionalidade'
		from (((igreja i inner join Igreja_has_Fundador h on i.PT_ID = h.Igreja_ID) inner join fundador f on h.Fundador_ID = f.ID) inner join ponto_turistico pt on i.PT_ID = pt.ID_PT)
		where pt.Tipo = 'Igreja' and i.Estilo = 'Rococó' and f.Nacionalidade = 'Brasileira' and i.Data_Funcadacao = '1778-03-27';