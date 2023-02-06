CREATE TABLE copa(
primeiro_lugar text NOT NULL,
ano date NOT NULL,
primary key (ano)
);
INSERT INTO copa (primeiro_lugar, ano)
VALUES ('Brasil', '2002-01-01');

INSERT INTO copa (primeiro_lugar, ano)
VALUES ('Itália', '2006-01-01');

INSERT INTO copa (primeiro_lugar, ano)
VALUES ('Espanha', '2010-01-01');

INSERT INTO copa (primeiro_lugar, ano)
VALUES ('Argentina', '2014-01-01');

INSERT INTO copa (primeiro_lugar, ano)
VALUES ('França', '2018-01-01');

INSERT INTO copa (primeiro_lugar, ano)
VALUES ('Alemanha', '2022-01-01');

INSERT INTO copa (primeiro_lugar, ano)
VALUES ('Alemanha', '1994-01-01');



UPDATE copa
SET primeiro_lugar = 'Brasil'
WHERE ano = '2022-01-01';

DELETE FROM copa
WHERE ano = '1994-01-01';
-----------------------------------------FIFA-------------------------------------------------
CREATE TABLE fifa(
descricao text NOT NULL
);

ALTER TABLE fifa
ADD id_fifa int NOT NULL;

ALTER TABLE fifa
ADD primary key(id_fifa);

INSERT INTO fifa (id_fifa, descricao)
VALUES (1, 'Copa do Mundo 2022');


INSERT INTO fifa (id_fifa, descricao)
VALUES (2, 'Copa do Mundo 2006');


INSERT INTO fifa (id_fifa, descricao)
VALUES (3, 'Copa do Mundo 2010');


INSERT INTO fifa (id_fifa, descricao)
VALUES (4,'Copa do Mundo 2014');


INSERT INTO fifa (id_fifa, descricao)
VALUES (5, 'Copa do Mundo 2018');

INSERT INTO fifa (id_fifa, descricao)
VALUES (6, 'Copa do Mundo 2002');

-----------------------------------------PAIS-------------------------------------------------

CREATE TABLE pais(
nome text NOT NULL,
nome_continente text NOT NULL,
data_jogos date,
id_fifa int NOT NULL,
id_evento int NOT NULL,
primary key (id_evento),
foreign key (id_fifa) references fifa(id_fifa)
);

INSERT INTO pais (nome, nome_continente, id_fifa, id_evento,data_jogos)
VALUES ('Brasil', 'América do Sul', 1, 1, '2022-01-01');

INSERT INTO pais (nome, nome_continente, id_fifa, id_evento,data_jogos)
VALUES ('Alemanha', 'Europa', 2, 2, '2006-01-01');

INSERT INTO pais (nome, nome_continente, id_fifa, id_evento,data_jogos)
VALUES ('Espanha', 'Europa', 3, 3,'2014-01-01' );

INSERT INTO pais (nome, nome_continente, id_fifa, id_evento,data_jogos)
VALUES ('Argentina', 'América do Sul', 4, 4, '2014-01-01');

INSERT INTO pais (nome, nome_continente, id_fifa, id_evento,data_jogos)
VALUES ('França', 'Europa', 5, 5, '2018-01-01');

INSERT INTO pais (nome, nome_continente, id_fifa, id_evento,data_jogos) VALUES ('Itália', 'Europa', 6, 6, '2002-01-01');

INSERT INTO pais (nome, nome_continente, id_fifa, id_evento,data_jogos)
VALUES ('Brasil', 'América do Sul', 5, 7, '2018-01-01');

INSERT INTO pais (nome, nome_continente, id_fifa, id_evento,data_jogos)
VALUES ('Bélgica', 'Europa', 2, 8, '2006-01-01');

INSERT INTO pais (nome, nome_continente, id_fifa, id_evento,data_jogos)
VALUES ('Marrocos', 'África', 3, 9, '2010-01-01');

INSERT INTO pais (nome, nome_continente, id_fifa, id_evento,data_jogos)
VALUES ('Croácia', 'Europa', 4, 10, '2014-01-01');


update pais
set data_jogos = '2002-01-01' where id_evento = 7



-----------------------------------------ESTADIO-------------------------------------------------

CREATE TABLE estadio(
nome text NOT NULL,
cidade text NOT NULL,
capacitacao int NOT NULL,
id_estadio int NOT NULL,
primary key (id_estadio)
);

UPDATE estadio
SET nome = 'Maracanã'
WHERE cidade = 'Rio de Janeiro';

DELETE FROM estadio
WHERE nome = 'Maracanã';

INSERT INTO estadio (nome, cidade, capacitacao,id_estadio)
VALUES ('Maracanã', 'Rio de Janeiro', 90000,1);

INSERT INTO estadio (nome, cidade, capacitacao,id_estadio)
VALUES ('Allianz Parque', 'São Paulo', 60000,2);

INSERT INTO estadio (nome, cidade, capacitacao,id_estadio)
VALUES ('Estádio Mineirão', 'Belo Horizonte', 62000,3);


-----------------------------------------TRANSMISSORA-------------------------------------------------

CREATE TABLE transmissora(

id_transmissora int NOT NULL,
nome text,
primary key (id_transmissora)
);

UPDATE transmissora
SET nome = 'Globo'
WHERE id_transmissora = 1; 

DELETE FROM transmissora
WHERE id_transmissora = 1;

INSERT INTO transmissora (id_transmissora, nome)
VALUES (1, 'Globo');

INSERT INTO transmissora (id_transmissora, nome)
VALUES (2, 'Record');


INSERT INTO transmissora (id_transmissora, nome)
VALUES (3, 'SporTV');


INSERT INTO transmissora (id_transmissora, nome)
VALUES (4, 'Fox Sports');


INSERT INTO transmissora (id_transmissora, nome)
VALUES (5, 'ESPN');

INSERT INTO transmissora (id_transmissora, nome)
VALUES (6, 'Band');


-----------------------------------------MEMBROS-------------------------------------------------

CREATE TABLE membros(
nome text ,
cpf int NOT NULL,
id_evento int NOT NULL,
primary key (cpf),
FOREIGN KEY (id_evento) REFERENCES pais(id_evento)
);

INSERT INTO membros (nome, cpf, id_evento)
VALUES ('Neymar', 111111111, 1);

INSERT INTO membros (nome, cpf, id_evento)
VALUES ('Klose', 222222222, 2);

INSERT INTO membros (nome, cpf, id_evento)
VALUES ('Iniesta', 333333333, 3);

INSERT INTO membros (nome, cpf, id_evento)
VALUES ('Ana Costa', 444444444, 4);

INSERT INTO membros (nome, cpf, id_evento)
VALUES ('Carlos Albuquerque', 555555555, 5);

INSERT INTO membros (nome, cpf, id_evento)
VALUES ('Bruna Silva', 666666666, 6);

INSERT INTO membros (nome, cpf, id_evento)
VALUES ('tite', 777777777, 7);

INSERT INTO membros (nome, cpf, id_evento)
VALUES ('felipão', 888888888, 8);

INSERT INTO membros (nome, cpf, id_evento)
VALUES ('dunga', 999999999, 9);

INSERT INTO membros (nome, cpf, id_evento)
VALUES ('Diniz', 101010101, 10);



-----------------------------------------JOGADOR-------------------------------------------------


CREATE TABLE jogador(
funcao text,
cpf_membros int NOT NULL,
posicao text,
importancia text,
primary key (cpf_membros),
foreign key (cpf_membros) references membros(cpf)

);

INSERT INTO jogador (funcao, cpf_membros, posicao, importancia)
VALUES ('Atacante', 333333333, 'Meio-campo', 'Alta');

INSERT INTO jogador (funcao, cpf_membros, posicao, importancia)
VALUES ('Atacante', 222222222, 'Ponta direita', 'Alta');

INSERT INTO jogador (funcao, cpf_membros, posicao, importancia)
VALUES ('Meio-campo', 111111111, 'Meia', 'Alta');

-----------------------------------------MEDICOS-------------------------------------------------

CREATE TABLE medicos(
);

ALTER TABLE medicos
ADD funcao text;

ALTER TABLE medicos
ADD cpf_membros int NOT NULL;



ALTER TABLE medicos
ADD formacao text;

ALTER TABLE medicos
ADD primary key (cpf_membros);

ALTER TABLE medicos
ADD foreign key (cpf_membros) references membros(cpf);

INSERT INTO medicos (funcao, cpf_membros, formacao)
VALUES ('Médico', 444444444, 'Cardiologia');

INSERT INTO medicos (funcao, cpf_membros, formacao)
VALUES ('Médico', 555555555, 'Ortopedia');

INSERT INTO medicos (funcao, cpf_membros, formacao)
VALUES ('fisioterapista',  666666666, 'Especialista em lesões');



-----------------------------------------TECNICO-------------------------------------------------

CREATE TABLE tecnico(
estilo_jogo text,
cpf_membros int,
formacao text,
primary key (cpf_membros),
foreign key (cpf_membros) references membros(cpf)

);


INSERT INTO tecnico (estilo_jogo, cpf_membros)
VALUES ('Tático', 777777777);

INSERT INTO tecnico (estilo_jogo, cpf_membros)
VALUES ('Tático', 888888888);

INSERT INTO tecnico (estilo_jogo, cpf_membros)
VALUES ('Ofensivo', 999999999);

INSERT INTO tecnico (estilo_jogo, cpf_membros)
VALUES ('Defensivo', 101010101);

-----------------------------------------ESTADIOS_PAIS-------------------------------------------------

CREATE TABLE estadios_pais (
    id_estadio int NOT NULL,
    id_pais int NOT NULL,
    primary key (id_estadio, id_pais),
    foreign key (id_estadio) references estadio(id_estadio),
    foreign key (id_pais) references pais(id_evento)
);

INSERT INTO estadios_pais (id_estadio, id_pais)
VALUES (1, 1);

INSERT INTO estadios_pais (id_estadio, id_pais)
VALUES (2,2);

INSERT INTO estadios_pais (id_estadio, id_pais)
VALUES (3, 3);


-----------------------------------------JOGOS-------------------------------------------------

CREATE TABLE jogos(
id_fifa int,
id_evento int,
primary key (id_evento, id_fifa),
foreign key (id_fifa) references fifa(id_fifa),
foreign key (id_evento) references pais(id_evento)
);
INSERT INTO jogos (id_fifa, id_evento)
VALUES (1, 1);

INSERT INTO jogos (id_fifa, id_evento)
VALUES (2, 2);

INSERT INTO jogos (id_fifa, id_evento)
VALUES (3, 3);

INSERT INTO jogos (id_fifa, id_evento)
VALUES (4, 4);

INSERT INTO jogos (id_fifa, id_evento)
VALUES (5, 5);

INSERT INTO jogos (id_fifa, id_evento)
VALUES (6, 6);



-----------------------------------------JGOSO EM ESTADIO-------------------------------------------------

CREATE TABLE jogos_em_estadio(
id_fifa int NOT NULL,
id_pais int,
id_estadio int,
primary key (id_pais, id_fifa,id_estadio),
foreign key (id_fifa) references fifa(id_fifa),
foreign key (id_pais) references pais(id_evento),
foreign key (id_estadio) references estadio(id_estadio)

);

INSERT INTO jogos_em_estadio (id_estadio, id_pais,id_fifa)
VALUES (1, 1,1);

INSERT INTO jogos_em_estadio (id_estadio, id_pais, id_fifa)
VALUES (2, 2,2);

INSERT INTO jogos_em_estadio (id_estadio, id_pais, id_fifa)
VALUES (3, 3, 3);
-----------------------------------------TRANSMITE-------------------------------------------------

CREATE TABLE transmite(
id_transmissora int,
id_fifa int,
id_evento int,
primary key (id_evento,id_transmissora,id_fifa),
foreign key (id_fifa) references fifa(id_fifa),
foreign key (id_evento) references pais(id_evento),
foreign key (id_transmissora) references transmissora(id_transmissora)

);

INSERT INTO transmite (id_transmissora, id_evento,id_fifa )
VALUES (1, 1,1);

INSERT INTO transmite (id_transmissora, id_evento,id_fifa )
VALUES (2, 2,2);

INSERT INTO transmite (id_transmissora, id_evento,id_fifa )
VALUES (3, 3,3);


CREATE TABLE sedia
(
    id_evento integer NOT NULL,
    ano_copa date NOT NULL,
    PRIMARY KEY (id_evento, ano_copa)
);

INSERT INTO sedia (id_evento, ano_copa)
VALUES (1, '2022-01-01');

INSERT INTO sedia (id_evento, ano_copa)
VALUES (2, '2018-01-01');

INSERT INTO sedia (id_evento, ano_copa)
VALUES (3, '2014-01-01' );




--Mostra as trnamissoras e em qual copa ela transmitiu
SELECT trans.nome, pais.data_jogos
FROM transmissora as trans, pais,transmite as mite
where trans.id_transmissora = mite.id_transmissora and mite.id_evento = pais.id_evento;


--mostra o pais que possui um estadio com o nome maracana
SELECT *
FROM pais,estadio
where pais.id_evento = 1 AND estadio.nome = 'Maracanã';


-- mostra todos os jogadores q possuem uma seleção
SELECT *
from pais,jogador,membros
where cpf_membros = cpf And membros.id_evento = pais.id_evento;


--Verifica membros que participaram da copa de 2022
Select *
from membros,pais,sedia
where membros.id_evento = pais.id_evento AND sedia.id_evento = pais.id_evento
and sedia.ano_copa = '2022-01-01';


--mostra o pais que possui um estadio com o nome maracana
SELECT pais.nome, estadio.nome
FROM estadios_pais
LEFT JOIN pais ON estadios_pais.id_pais = pais.id_evento
LEFT JOIN estadio ON estadios_pais.id_estadio = estadio.id_estadio
WHERE estadio.nome = 'Maracanã';


--consulta agrupa os países pelo seu continente e conta quantos países existem em cada grupo. O resultado é ordenado pela contagem em ordem decrescente.
SELECT nome_continente, COUNT(*) as contagem
FROM pais
GROUP BY nome_continente
ORDER BY contagem DESC;


--seleciona todos os jogadores de futebol que jogam na posição de atacante e meio-campista
SELECT * FROM jogador WHERE funcao = 'Atacante'
UNION
SELECT * FROM jogadoR WHERE funcao = 'Meio-campo';


--Junta todas as datas de jogos, com as datas que houveram copa do mundo
SELECT pais.data_jogos FROM pais
UNION
SELECT copa.ano FROM copa;


--Mostra o pais que sediouu e que foi campeao tambem

SELECT * FROM sedia,copa WHERE primeiro_lugar IN (SELECT pais.nome
													   from pais WHERE  sedia.ano_copa = copa.ano 
													   and pais.id_evento = sedia.id_evento
													   );

--Mostra em qual estadio cada seleção jogou
SELECT pais.nome,estadio.nome FROM pais,estadio,fifa WHERE exists (
	SELECT * FROM jogos_em_estadio as j WHERE j.id_estadio = estadio.id_estadio and j.id_pais = pais.id_evento and j.id_fifa = fifa.id_fifa);

--Mostra qual tecnico conseguiu ser campeão de uma copa
SELECT *
FROM copa,membros,pais
WHERE EXISTS (SELECT 1 FROM tecnico WHERE tecnico.cpf_membros = membros.cpf and 
membros.id_evento = pais.id_evento  and primeiro_lugar = pais.nome and pais.data_jogos = ano);

-- mostra todos os jogos que a seleçao do brasil ja jogou, independete do ano
SELECT *
FROM jogos,pais,fifa
WHERE jogos.id_evento = pais.id_evento and  jogos.id_fifa = fifa.id_fifa and pais.data_jogos in (SELECT pais.data_jogos FROM pais) AND (nome = 'Brasil');




