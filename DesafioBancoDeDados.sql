-- Tabelas do projeto
Select * From [dbo].[Atores]
Select * From [dbo].[Filmes]
Select * From [dbo].[Generos]
Select * From [dbo].[ElencoFilme]
Select * From [dbo].[FilmesGenero]

-- 1 - Buscar o nome e ano dos filmes
Select Nome, Ano From Filmes

-- 2 - Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano
Select Nome, Ano, Duracao From Filmes
Order by Ano 

-- 3 - Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração
Select Nome, Ano, Duracao From Filmes
Where Nome = 'De volta para o Futuro'

-- 4 - Buscar os filmes lançados em 1997
Select Nome, Ano, Duracao From Filmes
Where Ano = '1997'

-- 5 - Buscar os filmes lançados APÓS o ano 2000
Select Nome, Ano, Duracao From Filmes
Where Ano > '2000'

-- 6 - Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
Select Nome, Ano, Duracao From Filmes
Where Duracao > 100 AND Duracao < 150 
Order by Duracao 

-- 7 - Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente
SELECT Ano, COUNT(Ano) AS Quantidade
FROM filmes
GROUP BY Ano
ORDER BY Quantidade DESC;

-- 8 - Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
SELECT ID, PrimeiroNome, UltimoNome
FROM Atores
WHERE Genero = 'M';

-- 9 - Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
SELECT ID, PrimeiroNome, UltimoNome
FROM Atores
WHERE Genero = 'F'
Order By PrimeiroNome

-- 10 - Buscar o nome do filme e o gênero
Select f.Nome, g.Genero  
From Filmes f
Inner Join FilmesGenero fg on f.Id = fg.IdFilme
Inner Join Generos g on g.Id = fg.IdGenero

-- 11 - Buscar o nome do filme e o gênero do tipo "Mistério"
Select f.Nome, g.Genero  
From Filmes f
Inner Join FilmesGenero fg on f.Id = fg.IdFilme
Inner Join Generos g on g.Id = fg.IdGenero
Where g.Genero = 'Mistério'

-- 12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
Select f.Nome, a.PrimeiroNome, a.UltimoNome, el.Papel  
From Filmes f
Inner Join ElencoFilme el on f.Id = el.IdFilme
Inner Join Atores a on a.Id = el.IdAtor