
-- 3. Inserção de Dados (Ordem ajustada para respeitar as chaves estrangeiras)

-- 3.1. INSERTS PARA A TABELA plataforma
INSERT INTO plataforma (id_plataforma, nm_plataforma) VALUES
(1, 'PC'),
(2, 'PlayStation'),
(3, 'Xbox'),
(4, 'Nintendo');

-- 3.2. INSERTS PARA A TABELA subgenero_jogo
INSERT INTO subgenero_jogo (id_subgenero, nm_subgenero, desc_subgenero) VALUES
(1, 'Não Aplicável', 'Subgênero genérico ou não aplicável'),
(2, 'Metroidvania', 'Ação-aventura com mapa não-linear e habilidades'),
(3, 'Tiro Tático', 'FPS com foco em estratégia e realismo'),
(4, 'Roguelike/Roguelite', 'RPG com morte permanente e/ou progressão entre partidas'),
(5, 'Defesa de Torre', 'Estratégia de defesa contra ondas de inimigos'),
(6, 'Simulação de Vida/Fazenda', 'Simulação de gerenciamento de vida ou fazenda'),
(7, 'Corrida Arcade', 'Corrida com jogabilidade acessível e power-ups'),
(8, 'Construção e Gerenciamento', 'Foco em construir e gerenciar recursos ou cidades'),
(9, 'Mundo Aberto', 'Aventura com grande liberdade de exploração');

-- 3.3. INSERTS PARA A TABELA genero_jogo (Depende de subgenero_jogo)
INSERT INTO genero_jogo (id_genero_jogo, nm_genero_jogo, desc_genero_jogo, id_subgenero) VALUES
(1, 'Ação-Aventura', 'Combina elementos de ação e exploração', 2),
(2, 'Tiro', 'Foco em combate com armas de fogo', 3),
(3, 'RPG', 'Desenvolvimento de personagem e narrativa', 4),
(4, 'Estratégia', 'Planejamento e tática para alcançar a vitória', 5),
(5, 'Simulação', 'Simula atividades e sistemas do mundo real', 6),
(6, 'Corrida', 'Competição de velocidade', 7),
(7, 'Aventura', 'Foco em exploração e resolução de quebra-cabeças', 9),
(8, 'Indie', 'Jogo desenvolvido por uma equipe pequena ou independente', 1),
(9, 'Battle Royale', 'Múltiplos jogadores lutam até restar um vencedor', 1),
(10, 'Luta', 'Combate um contra um', 1),
(11, 'Plataforma', 'Pular entre plataformas para progredir', 1),
(12, 'Sobrevivência', 'Gerenciar recursos para sobreviver em ambiente hostil', 1),
(13, 'Horror', 'Projetado para causar medo e suspense', 1);

-- 3.4. INSERTS PARA A TABELA estúdio
INSERT INTO estúdio (id_estudio, nm_estudio, pais_estudio) VALUES
(1, 'Team Cherry', 'Austrália'),
(2, 'DICE', 'Suécia'),
(3, 'Supergiant Games', 'EUA'),
(4, 'PopCap Games', 'EUA'),
(5, 'ConcernedApe', 'EUA'),
(6, 'Nintendo', 'Japão'),
(7, 'Battlestate Games', 'Rússia'),
(8, 'Frontier Developments', 'Reino Unido'),
(9, 'Rockstar Games', 'EUA'),
(10, 'Naughty Dog', 'EUA'),
(11, 'FromSoftware', 'Japão'),
(12, 'CD Projekt Red', 'Polônia'),
(13, 'Ubisoft Montreal', 'Canadá'),
(14, 'Mojang Studios', 'Suécia'),
(15, 'Capcom', 'Japão'),
(16, 'Larian Studios', 'Bélgica'),
(17, 'Valve', 'EUA'),
(18, 'Psyonix', 'EUA'),
(19, 'InnerSloth', 'EUA'),
(20, 'SCS Software', 'República Tcheca'),
(21, 'Team PEAK', 'Internacional'),
(22, 'Semiwork', 'Suécia'),
(23, 'Ninja Kiwi', 'Nova Zelândia'),
(24, 'NetEase Games', 'China'),
(25, 'LocalThunk', 'Canadá'),
(26, 'Respawn Entertainment', 'EUA'),
(27, 'Coffee Stain Studios', 'Suécia'),
(28, 'The Behemoth', 'EUA'),
(29, 'Sunset Visitor', 'Canadá'),
(30, 'Atlus', 'Japão'),
(31, 'Toby Fox', 'EUA'),
(32, 'Telltale Games', 'EUA'),
(33, 'Enigma Studios', 'Brasil'),
(34, 'Polychroma Games', 'Filipinas'),
(35, 'Quantic Dream', 'França'),
(36, 'Gearbox Software', 'EUA'),
(37, 'TT Games', 'Reino Unido');

-- 3.5. INSERTS PARA A TABELA idioma
INSERT INTO idioma (id_idioma, nm_idioma) VALUES
(1, 'Inglês'),
(2, 'Espanhol'),
(3, 'Francês'),
(4, 'Alemão'),
(5, 'Chinês Simplificado'),
(6, 'Japonês'),
(7, 'Coreano'),
(8, 'Russo'),
(9, 'Português (Brasil)'),
(10, 'Italiano');

-- 3.6. INSERTS PARA A TABELA usuario
INSERT INTO usuario (id_usuario, nm_usuario, email_usuario) VALUES
(1, 'Carlos_Gamer', 'carlos.gamer@email.com'),
(2, 'Ana_Plays', 'ana.plays@email.com'),
(3, 'Player_Zero', 'player0@email.com'),
(4, 'Julia_RPGista', 'julia.rpg@email.com'),
(5, 'Marcos_Indie', 'marcos.indie@email.com'),
(6, 'Fernanda_Retro', 'fernanda.retro@email.com'),
(7, 'Leo_Estrategista', 'leo.estrategia@email.com'),
(8, 'Beatriz_Aventura', 'bia.aventura@email.com'),
(9, 'Thiago_Shooter', 'thiago.shooter@email.com'),
(10, 'Sofia_Coop', 'sofia.coop@email.com');

-- 3.7. INSERTS PARA A TABELA jogos (Depende de genero_jogo, plataforma, estúdio, idioma)
INSERT INTO jogos (id_jogo, id_genero_jogo, id_plataforma, id_estudio, id_idioma, nm_jogo, duracao_jogo, classIndicativa_jogo, desc_jogo, dt_lancamento) VALUES
(1, 1, 1, 1, 1, 'Hollow Knight: Silksong', 30, '10+', 'Aguardada sequência do aclamado metroidvania.', '2025-09-04'),
(2, 2, 1, 2, 1, 'Battlefield 6', 40, '18+', 'Guerra moderna em larga escala com destruição massiva.', '2025-08-09'),
(3, 3, 1, 3, 9, 'Hades 2', 25, '12+', 'Desafie o titã do tempo com a ajuda dos deuses do Olimpo.', '2025-09-25'),
(4, 4, 1, 4, 9, 'Plants vs. Zombies: Replanted', 20, 'Livre', 'Defenda seu jardim de hordas de zumbis com novas plantas.', '2025-10-23'),
(5, 5, 1, 5, 9, 'Stardew Valley', 150, 'Livre', 'Herde uma fazenda e construa uma nova vida no campo.', '2016-02-26'),
(6, 6, 4, 6, 9, 'Mario Kart World', 30, 'Livre', 'Corridas de kart em um mundo aberto com pistas interligadas.', '2025-06-05'),
(7, 2, 1, 7, 8, 'Escape from Duckvov', 150, '18+', 'FPS tático e realista com foco em extração e sobrevivência.', '2025-01-24'),
(8, 5, 1, 8, 1, 'Jurassic World Evolution 3', 60, '12+', 'Construa e gerencie o mais avançado parque de dinossauros.', '2025-10-21'),
(9, 3, 1, 16, 1, 'Baldurs Gate 3', 100, '18+', 'Volte aos Reinos Esquecidos em um conto de amizade e traição.', '2023-08-03'),
(10, 3, 1, 12, 1, 'The Witcher 3: Wild Hunt', 100, '16+', 'Cace monstros como o bruxo Geralt de Rivia em um vasto mundo aberto.', '2015-05-18'),
(11, 1, 2, 10, 9, 'The Last of Us Part I', 15, '18+', 'Sobreviva a uma jornada brutal em um mundo pós-pandêmico.', '2022-09-02'),
(12, 1, 2, 10, 9, 'God of War Ragnarök', 30, '18+', 'Kratos e Atreus enfrentam o fim dos tempos nórdico.', '2022-11-09'),
(13, 1, 4, 6, 9, 'The Legend of Zelda: Tears of the Kingdom', 80, '10+', 'Explore os céus e a superfície de Hyrule em uma nova aventura.', '2023-05-12'),
(14, 1, 1, 11, 1, 'Elden Ring', 80, '16+', 'Torne-se o Lorde Prístino nas Terras Intermédias.', '2022-02-25'),
(15, 7, 3, 9, 1, 'Red Dead Redemption 2', 60, '18+', 'Uma história épica de honra e lealdade no fim da era do Velho Oeste.', '2018-10-26'),
(16, 1, 1, 1, 1, 'Hollow Knight', 30, '10+', 'Explore um vasto reino de insetos e heróis.', '2017-02-24'),
(17, 12, 1, 7, 8, 'Escape from Tarkov', 200, '18+', 'FPS hardcore com elementos de sobrevivência e MMO.', '2017-07-28'),
(18, 3, 2, 15, 9, 'Dragons Dogma 2', 40, '16+', 'RPG de ação com peões controlados por IA em um mundo de fantasia.', '2024-03-21'),
(19, 2, 1, 2, 1, 'Battlefield 2042', 50, '16+', 'Guerra total em um futuro próximo com mapas dinâmicos.', '2021-11-12'),
(20, 5, 1, 14, 9, 'Minecraft', 100, 'Livre', 'Um mundo aberto de blocos para construir, minerar e sobreviver.', '2011-11-18'),
(21, 12, 1, 21, 1, 'Peak', 40, '10+', 'Jogo cooperativo de escalada intensa com elementos de sobrevivência em montanhas perigosas.', '2025-06-16'),
(22, 13, 1, 22, 1, 'R.E.P.O.', 30, '16+', 'Terror cooperativo em que a equipe coleta itens valiosos e tenta escapar viva das missões.', '2025-02-26'),
(23, 4, 1, 23, 1, 'Bloons TD 6', 60, 'Livre', 'Tower defense em que macacos usam torres e habilidades malucas para estourar ondas de bloons.', '2018-12-17'),
(24, 2, 1, 24, 1, 'Marvel Rivals', 80, '12+', 'Hero shooter 6v6 com heróis e vilões da Marvel em arenas dinâmicas e destrutíveis.', '2024-12-06'),
(25, 3, 1, 25, 1, 'Balatro', 50, '12+', 'Roguelike de baralho em que você monta mãos de pôquer e usa jokers para criar combos absurdos.', '2024-02-20'),
(26, 9, 1, 26, 1, 'Apex Legends', 120, '16+', 'Battle royale hero shooter em esquadrões que lutam em arenas cheias de mobilidade e habilidades.', '2019-02-04'),
(27, 5, 1, 27, 1, 'Satisfactory', 120, '12+', 'Simulador de fábrica em primeira pessoa focado em automação e exploração em um planeta alienígena.', '2024-09-10'),
(28, 1, 1, 28, 1, 'Castle Crashers', 15, '12+', 'Beat them up cooperativo medieval com até quatro cavaleiros e muita pancadaria colorida.', '2008-08-27'),
(29, 7, 1, 29, 1, '1000xResist', 20, '16+', 'Aventura sci-fi narrativa sobre clones, memória e resistência em um futuro pós-apocalíptico.', '2024-05-09'),
(30, 3, 1, 30, 1, 'Persona 4 Golden', 80, '16+', 'JRPG escolar em que um grupo de amigos investiga assassinatos misteriosos atravessando para um “mundo da TV”.', '2020-06-13'),
(31, 3, 1, 31, 1, 'Undertale', 10, '12+', 'RPG indie em que suas escolhas de combate e misericórdia definem a história.', '2015-09-15'),
(32, 3, 1, 31, 1, 'Deltarune', 15, '12+', 'Nova aventura de Toby Fox com batalhas em grupo e narrativa cheia de mistérios.', '2018-10-31'),
(33, 7, 1, 32, 1, 'The Walking Dead: The Telltale Definitive Series', 50, '18+', 'Coleção definitiva da série The Walking Dead da Telltale, focada em escolhas difíceis e narrativa emocional.', '2019-09-10'),
(34, 13, 1, 33, 1, 'Enigma of Fear', 8, '16+', 'Jogo de terror em que você investiga acontecimentos sobrenaturais em cenários claustrofóbicos.', '2024-11-28'),
(35, 7, 1, 34, 1, 'Until Then', 12, '12+', 'Aventura narrativa escolar sobre amizade, luto e segredos em uma cidade filipina.', '2024-06-25'),
(36, 11, 1, 28, 1, 'BattleBlock Theater', 12, '10+', 'Plataforma cooperativo cheio de humor absurdo, armadilhas e fases desafiadoras.', '2013-04-03'),
(37, 7, 1, 35, 1, 'Detroit: Become Human', 15, '18+', 'Thriller interativo em que androides lutam por liberdade e cada escolha muda o rumo da história.', '2018-05-25'),
(38, 2, 1, 36, 1, 'Borderlands 3', 40, '18+', 'Looter shooter em um universo caótico cheio de armas insanas, humor e cooperativo.', '2019-09-13'),
(39, 1, 1, 37, 1, 'LEGO Star Wars: The Skywalker Saga', 35, '10+', 'Reviva os nove filmes da saga Skywalker em uma aventura LEGO cheia de humor e exploração.', '2022-04-05'),
(40, 1, 1, 11, 1, 'Sekiro: Shadows Die Twice', 50, '18+', 'Ação intensa da FromSoftware, focada em combate preciso e exploração no Japão feudal.', '2019-03-22');

-- 3.8. INSERTS PARA A TABELA avaliacoes (Depende de usuario e jogos)
INSERT INTO avaliacoes (id_avaliacao, id_usuario, nota_avaliacao, desc_avaliacao, id_jogo) VALUES
(1, 1, 4.8, 'Mal posso esperar por este jogo! As expectativas estão altas.', 1),
(2, 2, 4.4, 'Promete ser o melhor da franquia, com gráficos de nova geração.', 2),
(3, 3, 4.7, 'Um dos melhores roguelikes já feitos. Jogabilidade viciante.', 3),
(4, 4, 4.3, 'Uma versão nostálgica e divertida do clássico tower defense.', 4),
(5, 5, 4.8, 'O jogo mais relaxante e completo de simulação de fazenda.', 5),
(6, 6, 4.6, 'A ideia de um mundo aberto para Mario Kart é genial.', 6),
(7, 7, 4.1, 'Um FPS tático que exige paciência e estratégia. Muito imersivo.', 7),
(8, 8, 4.5, 'Se for como os anteriores, será um excelente simulador de gerenciamento.', 8),
(9, 9, 4.8, 'Um RPG que define uma geração. Liberdade e narrativa incríveis.', 9),
(10, 10, 4.9, 'Obra-prima da narrativa e do desenvolvimento de personagens.', 10),
(11, 1, 4.7, 'Uma jornada emocional e inesquecível. Gráficos perfeitos.', 11),
(12, 2, 4.7, 'Conclusão épica para a saga nórdica. Combate brutal e história fantástica.', 12),
(13, 3, 4.8, 'Expandiu o mundo de Breath of the Wild de maneiras surpreendentes.', 13),
(14, 4, 4.8, 'Um mundo aberto vasto e impiedoso. A exploração é recompensadora.', 14),
(15, 5, 4.9, 'O jogo mais detalhado e imersivo que já joguei. Uma obra de arte.', 15),
(16, 6, 4.8, 'O original já era perfeito, e este é um clássico atemporal.', 16),
(17, 7, 4.1, 'Extremamente punitivo, mas a adrenalina da extração é única.', 17),
(18, 8, 4.4, 'O sistema de peões é inovador e o combate é muito divertido.', 18),
(19, 9, 3.4, 'Melhorou muito após o lançamento, mas ainda divide opiniões.', 19),
(20, 10, 4.8, 'Infinitas possibilidades. Um jogo para todas as idades.', 20);


-- FIM DO SCRIPT.
