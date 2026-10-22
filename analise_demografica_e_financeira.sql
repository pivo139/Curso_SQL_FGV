-- ============================================================================
-- PROJETO: Análise Demográfica, Socioeconômica e Transações (Base Gapminder / FGV)
-- Descrição: Consultas SQL aplicadas para manipulação, agregação e análise 
--            de dados globais (natalidade, mortalidade, PIB e transações).
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 1. ANÁLISE DE DADOS DEMOGRÁFICOS E EVOLUÇÃO TEMPORAL
-- ----------------------------------------------------------------------------

-- Consulta para investigar a taxa de natalidade nas Américas entre 2001 e 2010,
-- utilizando LEFT JOIN para garantir que anos sem dados de escolaridade apareçam.
SELECT 
    f.country,
    f.ref_year,
    f.mean_babies,
    wyas.mean_years
FROM fertility f
LEFT JOIN women_years_at_school wyas 
    ON f.country = wyas.country AND f.ref_year = wyas.ref_year
JOIN country c 
    ON f.country = c.country
WHERE f.ref_year BETWEEN 2001 AND 2010
  AND c.four_regions = 'americas'
ORDER BY f.country, f.ref_year;


-- ----------------------------------------------------------------------------
-- 2. AGREGAÇÕES E INDICADORES GLOBAIS POR REGIÃO
-- ----------------------------------------------------------------------------

-- Média de mortalidade infantil e PIB per capita por região (Banco Mundial, 2020)
SELECT 
    c.wb_regions,
    ROUND(AVG(cm.tot_deaths), 2) AS avg_child_mortality,
    ROUND(AVG(gdp.pib_per_capita), 2) AS avg_gdp_per_capita
FROM child_mortality cm
JOIN country c 
    ON cm.country = c.country
JOIN gdp_per_capita gdp 
    ON cm.country = gdp.country AND cm.ref_year = gdp.ref_year
WHERE cm.ref_year = 2020
GROUP BY c.wb_regions
ORDER BY avg_child_mortality DESC;


-- ----------------------------------------------------------------------------
-- 3. UTILIZAÇÃO DE FUNÇÕES DE AGREGAÇÃO E FILTROS DE MÍNIMO/MÁXIMO
-- ----------------------------------------------------------------------------

-- Identificando o país de cada região com a maior expectativa de vida em 1975
SELECT DISTINCT 
    c.wb_regions, 
    le.country, 
    MAX(le.tot_years) AS max_life_expectancy
FROM life_expectancy le
JOIN country c 
    ON c.country = le.country
WHERE le.ref_year = 1975
GROUP BY c.wb_regions, le.country, le.tot_years
ORDER BY c.wb_regions;


-- ----------------------------------------------------------------------------
-- 4. CONTROLE DE TRANSAÇÕES (EXEMPLO DE DML)
-- ----------------------------------------------------------------------------

-- Exemplo prático de transação segura para alteração/inserção de dados
BEGIN TRANSACTION;

-- Inserção ou atualização simulada
-- (Exemplo: Atualizando dados de um registro de país)
UPDATE country 
SET four_regions = 'americas' 
WHERE country = 'Exemplo_Pais';

-- Se tudo ocorrer bem, efetiva as alterações:
COMMIT;

-- Caso ocorra algum erro na execução dos passos, a transação inteira é desfeita:
-- ROLLBACK;