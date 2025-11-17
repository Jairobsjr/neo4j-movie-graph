# Modelo de Dados — Movie Graph

## 🧩 Entidades Principais

### User
- id
- name
- country
- relacionamentos:
  - WATCHED → Movie/Series

### Actor
- id
- name
- country
- relacionamentos:
  - ACTED_IN → Movie/Series

### Director
- id
- name
- country
- relacionamentos:
  - DIRECTED → Movie/Series

### Genre
- type  
- relacionamentos:
  - BELONGS_TO ← Movie/Series

### Movie / Serie (Title)
- id
- name
- year
- duration
- number_seasons (series only)

---

## 🔗 Relacionamentos

| Relacionamento | De | Para | Propriedades |
|----------------|----|------|---------------|
| WATCHED | User | Movie/Series | rating |
| ACTED_IN | Actor | Movie/Series | — |
| DIRECTED | Director | Movie/Series | — |
| BELONGS_TO | Movie/Series | Genre | — |