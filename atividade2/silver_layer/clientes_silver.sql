CREATE OR REPLACE TABLE saraiva.clientes_silver AS
SELECT
    client_id,
    company_id,
    TRIM(COALESCE(nome_fantasia, '')) AS nome_fantasia,
    PARSE_DATE('%Y%m%d', CAST(data_inicio_atividade AS STRING)) AS data_inicio_atividade, -- Converte INTEGER YYYYMMDD para DATE
    COALESCE(cnae_fiscal_principal, 0) AS cnae_fiscal_principal,
    COALESCE(cnae_fiscal_secundaria, 0.0) AS cnae_fiscal_secundaria,
    TRIM(COALESCE(tipo_logradouro, '')) AS tipo_logradouro,
    TRIM(COALESCE(logradouro, '')) AS logradouro,
    TRIM(COALESCE(numero, '')) AS numero,
    TRIM(COALESCE(complemento, '')) AS complemento,
    TRIM(COALESCE(bairro, '')) AS bairro,
    COALESCE(cep, 0) AS cep,
    TRIM(COALESCE(uf, '')) AS uf,
    municipio,
    COALESCE(ddd_1, 0) AS ddd_1,
    TRIM(COALESCE(telefone_1, '')) AS telefone_1,
    COALESCE(ddd_2, 0) AS ddd_2,
    COALESCE(telefone_2, 0) AS telefone_2,
    COALESCE(ddd_fax, 0) AS ddd_fax,
    COALESCE(fax, 0) AS fax,
    TRIM(COALESCE(correio_eletronico, '')) AS correio_eletronico,
    COALESCE(cnpj, 0) AS cnpj
FROM
    saraiva.clientes
QUALIFY ROW_NUMBER() OVER (PARTITION BY client_id, company_id ORDER BY client_id) = 1;