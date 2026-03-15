// VER TODOS OS USUÁRIOS

MATCH (u:Usuario)
RETURN u;



// VER TODOS OS FILMES

MATCH (f:Filme)
RETURN f;



// FILMES QUE OS USUÁRIOS ASSISTIRAM

MATCH (u:Usuario)-[:ASSISTIU]->(f:Filme)
RETURN u.nome AS Usuario, f.titulo AS Filme;



// FILMES COM SEUS GÊNEROS

MATCH (f:Filme)-[:PERTENCE_AO_GENERO]->(g:Genero)
RETURN f.titulo AS Filme, g.nome AS Genero;



// ATORES E OS FILMES EM QUE ATUARAM

MATCH (a:Ator)-[:ATUOU_EM]->(f:Filme)
RETURN a.nome AS Ator, f.titulo AS Filme;



// DIRETORES E OS FILMES QUE DIRIGIRAM

MATCH (d:Diretor)-[:DIRIGIU]->(f:Filme)
RETURN d.nome AS Diretor, f.titulo AS Filme;



// FILMES ASSISTIDOS COM NOTA

MATCH (u:Usuario)-[r:ASSISTIU]->(f:Filme)
RETURN u.nome AS Usuario, f.titulo AS Filme, r.nota AS Nota;



// USUÁRIOS QUE ASSISTIRAM OS MESMOS FILMES

MATCH (u1:Usuario)-[:ASSISTIU]->(f:Filme)<-[:ASSISTIU]-(u2:Usuario)
WHERE u1 <> u2
RETURN u1.nome AS Usuario1, u2.nome AS Usuario2, f.titulo AS Filme;



// FILMES COM SEUS ATORES

MATCH (a:Ator)-[:ATUOU_EM]->(f:Filme)
RETURN f.titulo AS Filme, collect(a.nome) AS Atores;



// RECOMENDAR FILMES PARA UM USUÁRIO

MATCH (u:Usuario {nome:"Ana"})-[:ASSISTIU]->(f:Filme)<-[:ASSISTIU]-(outro:Usuario)
MATCH (outro)-[:ASSISTIU]->(recomendado:Filme)
WHERE NOT (u)-[:ASSISTIU]->(recomendado)
RETURN recomendado.titulo AS Filme_Recomendado, count(*) AS Popularidade
ORDER BY Popularidade DESC;



// RECOMENDAR FILMES DO MESMO GÊNERO

MATCH (u:Usuario {nome:"Ana"})-[:ASSISTIU]->(f:Filme)
MATCH (f)-[:PERTENCE_AO_GENERO]->(g:Genero)
MATCH (recomendado:Filme)-[:PERTENCE_AO_GENERO]->(g)
WHERE NOT (u)-[:ASSISTIU]->(recomendado)
RETURN recomendado.titulo AS Filme_Recomendado, g.nome AS Genero;
