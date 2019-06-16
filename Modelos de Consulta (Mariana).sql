-- Modelos de buscas --

-- 1 - Dado nome de uma cidade, deseja-se saber:
	-- 1.1 - Quais os pontos turísticos e seus endereços
		select pt.nome 'Ponto Turístico', c.nome 'Cidade', c.uf 'UF', e.Tipo_Logradouro 'Tipo de Logradouro', 
        e.Nome 'Nome Logradouro', e.Numero 'Número', e.bairro 'Bairro', e.cep 'CEP', e.Complemento 'Complemento'
        from (ponto_turistico pt inner join endereco e on e.ID_Endereco = pt.ID_PT) inner join cidade c on c.ID_Cidade = pt.Cidade_ID
        where c.nome = 'Rio de Janeiro'; -- Altera o o nome da cidade

	-- 1.2 - Quais as igrejas e museus mais antigos com fundadores nacionais;
		
        select pt.nome 'Ponto Turístico', c.populacao 'População', m.Data_Fundacao "Fundacao"
        from  (((igreja i inner join igreja_has_fundador s on i.PT_ID = s.igreja_ID) inner join
        (museu m inner join museu_has_fundador h on m.PT_ID = h.Museu_ID) inner join fundador f on 
		s.Fundador_ID and h.Fundador_ID = f.ID) inner join ponto_turistico pt on i.PT_ID and m.PT_ID = pt.ID_PT) 
		inner join cidade c on pt.Cidade_ID = c.ID_Cidade
		where c.nome = 'Sobral' and f.nacionalidade = 'Brasileira' and m.Data_Fundacao >= '1800-03-27'
        group by pt.nome;
        
	-- 1.3 - Quais são as casas de show que estão abertas em um determinado dia da semana funcionando a partir de um determinado horário;
		select pt.Nome 'Casa de Show', cs.Especialidade_Rest 'Especialidade do Restaurante', cs.Preco_Medio_Rest 'Preço Médio do Restaurante'
        from (casa_de_show cs  inner join ponto_turistico pt on cs.PT_ID = pt.ID_PT) inner join  cidade c on pt.Cidade_ID = c.ID_Cidade
        where Dia_de_Fechamento != 'Terça-Feira' and Horario_Inicio >= '22:00';
	
    -- 1.4 - Quais os melhores hotéis (acima de 3 estrelas) que possuem restaurante aberto nos 3 próximos dias.
		select h.Nome_Hotel "Hotel", h.Categoria "Categoria", r.Nome "Restaurante"
		from (hotel as h inner join restaurante as r on r.ID_Restaurante = h.Restaurante_ID) 
		inner join cidade as c on h.Cidade_ID = c.ID_Cidade
		where c.nome = "Rio de Janeiro" and h.Categoria > 3 
    
	-- 2. Dado uma especialidade de comida e 3 (três) datas sequeciais, deseja-se saber:
    -- 2.1 Quais as cidades que possuem restaurantes daquela especialidade, abertos nas datas indicadas;
    
        select* 
        from Cidade as c inner join Restaurante as r on c.ID_Cidade = r.Cidade_ID inner join Casa_de_Show as cs on cs.Especialidade_Rest = "Fast Food" and cs.Dia_de_Fechamento != "Sabado" and r.ID_Restaurante = cs.Restaurante_ID;
	
    -- 2.2 Quais os hotéis que possuem restaurantes daquela especialidade, abertos nas datas indicadas
    
	    select * 
        from Hotel as h inner join Casa_de_Show as cs on h.Restaurante_ID = cs.Restaurante_ID and cs.Especialidade_Rest = "Churrasco" and cs.Dia_de_Fechamento != "Terça-Feira";
	
    -- 2.3 Quais as casas de show que não possuem restaurante daquela especialidade e que não abrem na data inicial do périodo informado no mesmo.
    
        select * 
        from Casa_de_Show as cs inner join Restaurante as r on cs.Restaurante_ID = r.ID_Restaurante and cs.Dia_de_Fechamento = "Segunda-Feira" and  cs.Especialidade_Rest != "Fast Food";
    
    
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
		select c.nome "Cidade", pt.nome 'Ponto Turístico', c.populacao 'População', m.Data_Fundacao "Fundacao"
        from ((((igreja i inner join Igreja_has_Fundador h on i.PT_ID = h.Igreja_ID) inner join fundador f on 
        h.Fundador_ID = f.ID) inner join ponto_turistico pt on i.PT_ID = pt.ID_PT) inner join endereco e on 
        e.ID_Endereco = pt.ID_PT) inner join  cidade c on pt.Cidade_ID = c.ID_Cidade, ((((museu m inner join 
        museu_has_fundador hh on m.PT_ID = hh.Museu_ID) inner join fundador ff on hh.Fundador_ID = ff.ID) inner join 
        ponto_turistico ptt on m.PT_ID = ptt.ID_PT) inner join endereco ee on ee.ID_Endereco = ptt.ID_PT) inner join  
        cidade cc on ptt.Cidade_ID = cc.ID_Cidade
		where f.nacionalidade = 'Brasileira' and c.populacao >= '600000' and c.populacao <= '6000000' 
        and i.Data_Funcadacao >= '1900-03-27'
        group by pt.nome;
        
    -- 3.3- Quais as igrejas de certo estilo (p. ex.: “Art Nouveau”) fundadas por nativos daquela nação em
    -- um determinado período (p. ex: Século XIX).
		select pt.Nome 'Ponto Turístico', pt.Tipo 'Tipo', i.Estilo 'Estilo', i.Data_Funcadacao 'Data de Fundação',
		f.nome 'Nome do Fundador', f.nacionalidade 'Nacionalidade'
		from (((igreja i inner join Igreja_has_Fundador h on i.PT_ID = h.Igreja_ID) inner join fundador f on h.Fundador_ID = f.ID) inner join ponto_turistico pt on i.PT_ID = pt.ID_PT)
		where pt.Tipo = 'Igreja' and i.Estilo = 'Rococó' and f.Nacionalidade = 'Brasileira' and i.Data_Funcadacao = '1778-03-27';
        
     -- 4 - Criar uma visão para listar os nomes das cidades (em ordem alfabética), com suas igrejas, seus
     -- hotéis, seus museus e suas casas de show e com seus respectivos restaurantes, quando se aplicar.
     
        create view pontos_turisticos_cidades as select*
		from pontos_turisticos, restaurantes_hoteis, restaurantes_casas_show;
        select*
        from pontos_turisticos_cidades;
        
	 -- 5 - Criar uma visão para listar, para cada cidade, o total de quartos para cada tipo de quarto, com
	 -- seus preços médios de diárias por tipo.
     
		 create view cidade_quarto as select c.nome "Cidade", q.tipo "Tipo", count(q.tipo) "Quantidade", sum(q.Valor)/count(q.tipo) "Valor Medio"
		 from (quarto as q inner join hotel as h on q.Hotel_ID = h.ID_Hotel) inner join cidade as c on 
		 h.Cidade_ID = c.ID_Cidade
         where c.nome = "Rio de Janeiro" and q.tipo = "Luxo";
        
	 -- 6 - Criar uma trigger para atualizar os pontos turísticos de uma cidade a cada vez que se insere um
	 -- novo elemento em qualquer dos subtipos deste tipo de elemento (igreja, casa de show ou museu).
        
	delimiter //
     create trigger atualiza_pt
     after insert on ponto_turistico for each row
     begin
		declare var_count int;
		select count(nome) into var_count from ponto_turistico;
		update tab_turisticos_atualiza set quantidade = var_count where id = 1;
     end;//
     
     delimiter ;
        
	 -- 7 - Criar outras consultas, visões e/ou triggers que considerar relevantes para o uso da aplicação.
     
		-- Visão dos pontos turisticos de uma cidade
        create view pontos_turisticos as select c.Nome "Cidade_1", pt.Tipo "Tipo_1", pt.Nome "Pontos Turisticos_1" 
		from cidade as c inner join ponto_turistico as pt on c.ID_Cidade = pt.Cidade_ID and pt.Tipo != "Casa de Show"
		order by c.nome;
		-- Visão dos hoteis com restaurantes em uma cidade
		create view restaurantes_hoteis as select cc.Nome "Cidade_2", h.Nome_Hotel "Hotel_2" , r.Nome "Restaurantes_2"
		from (restaurante as r inner join hotel as h on r.ID_Restaurante = h.Restaurante_ID) inner join cidade as cc on h.Cidade_ID = cc.ID_Cidade
		order by cc.nome;
		-- Visão das casa de show com restaurantes
        create view restaurantes_casas_show as select ccc.Nome "Cidade_3", ptt.Nome "Pontos Turisticos_3", r.Nome "Restaurantes_3"
		from ((restaurante as r inner join casa_de_show as cs on r.ID_Restaurante = cs.Restaurante_ID) inner join ponto_turistico as ptt on cs.PT_ID = ptt.ID_PT) inner join cidade as ccc on ccc.ID_Cidade = ptt.Cidade_ID
		order by ccc.nome;