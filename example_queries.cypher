// Todos os filmes e seus gêneros
MATCH (m:Movie)-[:BELONGS_TO]->(g:Genre)
RETURN m, g;

// Filmes que Leonardo DiCaprio atuou
MATCH (a:Actor {name:"Leonardo DiCaprio"})-[:ACTED_IN]->(m)
RETURN a, m;

// Recomendar filmes do mesmo gênero que o usuário gostou
MATCH (u:User {id:"U01"})-[:WATCHED]->(m:Movie)-[:BELONGS_TO]->(g)
MATCH (rec:Movie)-[:BELONGS_TO]->(g)
WHERE rec <> m
RETURN DISTINCT rec, g;

// Usuários que assistiram o mesmo filme
MATCH (u:User)-[:WATCHED]->(m:Movie)<-[:WATCHED]-(other:User)
WHERE u.id = "U01" AND other <> u
RETURN m, other;
