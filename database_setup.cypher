// -------------------------------
// CREATE ACTORS (10)
// -------------------------------
CREATE
(a1:Actor {id: "A01", name: "Lucas Andrade", country: "Brasil"}),
(a2:Actor {id: "A02", name: "Marina Costa", country: "Brasil"}),
(a3:Actor {id: "A03", name: "Ethan Miller", country: "EUA"}),
(a4:Actor {id: "A04", name: "Sofia Navarro", country: "México"}),
(a5:Actor {id: "A05", name: "Akira Tanaka", country: "Japão"}),
(a6:Actor {id: "A06", name: "Emma Johansson", country: "Suécia"}),
(a7:Actor {id: "A07", name: "Victor Almeida", country: "Portugal"}),
(a8:Actor {id: "A08", name: "Chloe Martin", country: "França"}),
(a9:Actor {id: "A09", name: "Diego Cabrera", country: "Chile"}),
(a10:Actor {id: "A10", name: "Liam Brown", country: "Canadá"});


// -------------------------------
// CREATE DIRECTORS (5)
// -------------------------------
CREATE
(d1:Director {id: "D01", name: "Carla Mendes", country: "Brasil"}),
(d2:Director {id: "D02", name: "Jonathan Price", country: "EUA"}),
(d3:Director {id: "D03", name: "Hiroshi Saito", country: "Japão"}),
(d4:Director {id: "D04", name: "Ana Rodríguez", country: "Espanha"}),
(d5:Director {id: "D05", name: "Oliver Becker", country: "Alemanha"});


// -------------------------------
// CREATE GENRES (5)
// -------------------------------
CREATE
(g1:Genre {type: "Ação"}),
(g2:Genre {type: "Drama"}),
(g3:Genre {type: "Comédia"}),
(g4:Genre {type: "Ficção Científica"}),
(g5:Genre {type: "Suspense"});


// -------------------------------
// CREATE MOVIES (10)
// -------------------------------
CREATE
(f1:Movie:Title {id:"M01", name:"Fronteira Final", year:2022, duration:118}),
(f2:Movie:Title {id:"M02", name:"Sombras do Passado", year:2021, duration:104}),
(f3:Movie:Title {id:"M03", name:"Risos em Paris", year:2020, duration:97}),
(f4:Movie:Title {id:"M04", name:"O Último Samurai Urbano", year:2023, duration:131}),
(f5:Movie:Title {id:"M05", name:"Conexão Perdida", year:2019, duration:110}),
(f6:Movie:Title {id:"M06", name:"Até o Amanhecer", year:2024, duration:122}),
(f7:Movie:Title {id:"M07", name:"Missão Polar", year:2018, duration:101}),
(f8:Movie:Title {id:"M08", name:"Código Azul", year:2022, duration:116}),
(f9:Movie:Title {id:"M09", name:"O Palhaço Misterioso", year:2020, duration:89}),
(f10:Movie:Title {id:"M10", name:"Horizontes Partidos", year:2023, duration:128});


// -------------------------------
// CREATE USERS (10)
// -------------------------------
CREATE
(u1:User {id:"U01", name:"Jairo Silva", country:"Brasil"}),
(u2:User {id:"U02", name:"Marina Duarte", country:"Brasil"}),
(u3:User {id:"U03", name:"Carlos Jiménez", country:"México"}),
(u4:User {id:"U04", name:"Emily Johnson", country:"EUA"}),
(u5:User {id:"U05", name:"Akira Nakamoto", country:"Japão"}),
(u6:User {id:"U06", name:"Anna Müller", country:"Alemanha"}),
(u7:User {id:"U07", name:"Pedro Carvalho", country:"Portugal"}),
(u8:User {id:"U08", name:"Laura Rossi", country:"Itália"}),
(u9:User {id:"U09", name:"Sophie Dubois", country:"França"}),
(u10:User {id:"U10", name:"Daniel Thompson", country:"Canadá"});


// -------------------------------
// DIRECTORS → MOVIES
// -------------------------------
CREATE
(d1)-[:DIRECTED]->(f1),
(d1)-[:DIRECTED]->(f6),

(d2)-[:DIRECTED]->(f2),
(d2)-[:DIRECTED]->(f3),

(d3)-[:DIRECTED]->(f4),
(d3)-[:DIRECTED]->(f8),

(d4)-[:DIRECTED]->(f5),
(d4)-[:DIRECTED]->(f9),

(d5)-[:DIRECTED]->(f7),
(d5)-[:DIRECTED]->(f10);


// -------------------------------
// MOVIES → GENRES
// -------------------------------
CREATE
(f1)-[:HAS_GENRE]->(g4),
(f2)-[:HAS_GENRE]->(g5),
(f3)-[:HAS_GENRE]->(g3),
(f4)-[:HAS_GENRE]->(g1),
(f5)-[:HAS_GENRE]->(g2),
(f6)-[:HAS_GENRE]->(g2),
(f7)-[:HAS_GENRE]->(g1),
(f8)-[:HAS_GENRE]->(g4),
(f9)-[:HAS_GENRE]->(g3),
(f10)-[:HAS_GENRE]->(g5);


// -------------------------------
// ACTORS → MOVIES
// -------------------------------
CREATE
(a1)-[:ACTED_IN]->(f1),
(a1)-[:ACTED_IN]->(f5),

(a2)-[:ACTED_IN]->(f2),
(a2)-[:ACTED_IN]->(f6),

(a3)-[:ACTED_IN]->(f3),
(a3)-[:ACTED_IN]->(f7),

(a4)-[:ACTED_IN]->(f4),
(a4)-[:ACTED_IN]->(f9),

(a5)-[:ACTED_IN]->(f1),
(a5)-[:ACTED_IN]->(f8),

(a6)-[:ACTED_IN]->(f2),
(a6)-[:ACTED_IN]->(f10),

(a7)-[:ACTED_IN]->(f3),
(a7)-[:ACTED_IN]->(f8),

(a8)-[:ACTED_IN]->(f4),
(a8)-[:ACTED_IN]->(f6),

(a9)-[:ACTED_IN]->(f5),
(a9)-[:ACTED_IN]->(f7),

(a10)-[:ACTED_IN]->(f9),
(a10)-[:ACTED_IN]->(f10);


// -------------------------------
// USERS → WATCHED → MOVIES
// -------------------------------
CREATE
(u1)-[:WATCHED {rating: 5}]->(f1),
(u1)-[:WATCHED {rating: 4}]->(f4),
(u1)-[:WATCHED {rating: 3}]->(f7),

(u2)-[:WATCHED {rating: 4}]->(f3),
(u2)-[:WATCHED {rating: 2}]->(f1),
(u2)-[:WATCHED {rating: 5}]->(f10),

(u3)-[:WATCHED {rating: 5}]->(f2),
(u3)-[:WATCHED {rating: 3}]->(f5),
(u3)-[:WATCHED {rating: 4}]->(f8),
(u3)-[:WATCHED {rating: 2}]->(f9),

(u4)-[:WATCHED {rating: 3}]->(f1),
(u4)-[:WATCHED {rating: 4}]->(f3),
(u4)-[:WATCHED {rating: 5}]->(f6),
(u4)-[:WATCHED {rating: 4}]->(f7),

(u5)-[:WATCHED {rating: 5}]->(f4),
(u5)-[:WATCHED {rating: 5}]->(f8),
(u5)-[:WATCHED {rating: 3}]->(f2),

(u6)-[:WATCHED {rating: 3}]->(f5),
(u6)-[:WATCHED {rating: 4}]->(f7),
(u6)-[:WATCHED {rating: 4}]->(f9),
(u6)-[:WATCHED {rating: 2}]->(f10),

(u7)-[:WATCHED {rating: 5}]->(f3),
(u7)-[:WATCHED {rating: 3}]->(f6),
(u7)-[:WATCHED {rating: 4}]->(f8),

(u8)-[:WATCHED {rating: 2}]->(f1),
(u8)-[:WATCHED {rating: 4}]->(f5),
(u8)-[:WATCHED {rating: 5}]->(f9),
(u8)-[:WATCHED {rating: 3}]->(f10),

(u9)-[:WATCHED {rating: 4}]->(f2),
(u9)-[:WATCHED {rating: 3}]->(f4),
(u9)-[:WATCHED {rating: 5}]->(f6),
(u9)-[:WATCHED {rating: 4}]->(f8),

(u10)-[:WATCHED {rating: 5}]->(f7),
(u10)-[:WATCHED {rating: 4}]->(f3),
(u10)-[:WATCHED {rating: 3}]->(f9);
