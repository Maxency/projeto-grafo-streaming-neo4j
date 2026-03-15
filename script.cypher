// CRIANDO CONSTRAINTS

CREATE CONSTRAINT usuario_id IF NOT EXISTS
FOR (u:Usuario) REQUIRE u.id IS UNIQUE;

CREATE CONSTRAINT filme_id IF NOT EXISTS
FOR (f:Filme) REQUIRE f.id IS UNIQUE;



// CRIANDO USUÁRIOS

CREATE
(:Usuario {id:1, nome:"Ana"}),
(:Usuario {id:2, nome:"Bruno"}),
(:Usuario {id:3, nome:"Carlos"}),
(:Usuario {id:4, nome:"Daniela"}),
(:Usuario {id:5, nome:"Eduardo"}),
(:Usuario {id:6, nome:"Fernanda"}),
(:Usuario {id:7, nome:"Gabriel"}),
(:Usuario {id:8, nome:"Helena"}),
(:Usuario {id:9, nome:"Igor"}),
(:Usuario {id:10, nome:"Julia"});



// CRIANDO FILMES

CREATE
(:Filme {id:1, titulo:"A Origem"}),
(:Filme {id:2, titulo:"Matrix"}),
(:Filme {id:3, titulo:"Interestelar"}),
(:Filme {id:4, titulo:"Avatar"}),
(:Filme {id:5, titulo:"Titanic"}),
(:Filme {id:6, titulo:"Coringa"}),
(:Filme {id:7, titulo:"Gladiador"}),
(:Filme {id:8, titulo:"The Batman"}),
(:Filme {id:9, titulo:"Duna"}),
(:Filme {id:10, titulo:"Oppenheimer"});



// CRIANDO ATORES

CREATE
(:Ator {nome:"Leonardo DiCaprio"}),
(:Ator {nome:"Keanu Reeves"}),
(:Ator {nome:"Matthew McConaughey"}),
(:Ator {nome:"Joaquin Phoenix"}),
(:Ator {nome:"Russell Crowe"});



// CRIANDO DIRETORES

CREATE
(:Diretor {nome:"Christopher Nolan"}),
(:Diretor {nome:"James Cameron"}),
(:Diretor {nome:"Todd Phillips"}),
(:Diretor {nome:"Ridley Scott"}),
(:Diretor {nome:"Denis Villeneuve"});



// CRIANDO GÊNEROS

CREATE
(:Genero {nome:"Ficcao Cientifica"}),
(:Genero {nome:"Acao"}),
(:Genero {nome:"Drama"}),
(:Genero {nome:"Aventura"});



// RELACIONAMENTOS

// Usuários assistiram filmes

MATCH (u:Usuario {nome:"Ana"}),(f:Filme {titulo:"Matrix"})
CREATE (u)-[:ASSISTIU {nota:5}]->(f);

MATCH (u:Usuario {nome:"Bruno"}),(f:Filme {titulo:"Avatar"})
CREATE (u)-[:ASSISTIU {nota:4}]->(f);

MATCH (u:Usuario {nome:"Carlos"}),(f:Filme {titulo:"Titanic"})
CREATE (u)-[:ASSISTIU {nota:5}]->(f);

MATCH (u:Usuario {nome:"Daniela"}),(f:Filme {titulo:"Coringa"})
CREATE (u)-[:ASSISTIU {nota:4}]->(f);

MATCH (u:Usuario {nome:"Eduardo"}),(f:Filme {titulo:"Gladiador"})
CREATE (u)-[:ASSISTIU {nota:5}]->(f);



// ATORES NOS FILMES

MATCH (a:Ator {nome:"Leonardo DiCaprio"}),(f:Filme {titulo:"A Origem"})
CREATE (a)-[:ATUOU_EM]->(f);

MATCH (a:Ator {nome:"Keanu Reeves"}),(f:Filme {titulo:"Matrix"})
CREATE (a)-[:ATUOU_EM]->(f);

MATCH (a:Ator {nome:"Matthew McConaughey"}),(f:Filme {titulo:"Interestelar"})
CREATE (a)-[:ATUOU_EM]->(f);

MATCH (a:Ator {nome:"Joaquin Phoenix"}),(f:Filme {titulo:"Coringa"})
CREATE (a)-[:ATUOU_EM]->(f);

MATCH (a:Ator {nome:"Russell Crowe"}),(f:Filme {titulo:"Gladiador"})
CREATE (a)-[:ATUOU_EM]->(f);



// DIRETORES DOS FILMES

MATCH (d:Diretor {nome:"Christopher Nolan"}),(f:Filme {titulo:"A Origem"})
CREATE (d)-[:DIRIGIU]->(f);

MATCH (d:Diretor {nome:"James Cameron"}),(f:Filme {titulo:"Avatar"})
CREATE (d)-[:DIRIGIU]->(f);

MATCH (d:Diretor {nome:"Todd Phillips"}),(f:Filme {titulo:"Coringa"})
CREATE (d)-[:DIRIGIU]->(f);

MATCH (d:Diretor {nome:"Ridley Scott"}),(f:Filme {titulo:"Gladiador"})
CREATE (d)-[:DIRIGIU]->(f);

MATCH (d:Diretor {nome:"Denis Villeneuve"}),(f:Filme {titulo:"Duna"})
CREATE (d)-[:DIRIGIU]->(f);



 //GÊNEROS DOS FILMES

MATCH (f:Filme {titulo:"Matrix"}),(g:Genero {nome:"Ficcao Cientifica"})
CREATE (f)-[:PERTENCE_AO_GENERO]->(g);

MATCH (f:Filme {titulo:"Avatar"}),(g:Genero {nome:"Aventura"})
CREATE (f)-[:PERTENCE_AO_GENERO]->(g);

MATCH (f:Filme {titulo:"Titanic"}),(g:Genero {nome:"Drama"})
CREATE (f)-[:PERTENCE_AO_GENERO]->(g);

MATCH (f:Filme {titulo:"Coringa"}),(g:Genero {nome:"Drama"})
CREATE (f)-[:PERTENCE_AO_GENERO]->(g);

MATCH (f:Filme {titulo:"Gladiador"}),(g:Genero {nome:"Acao"})
CREATE (f)-[:PERTENCE_AO_GENERO]->(g);
