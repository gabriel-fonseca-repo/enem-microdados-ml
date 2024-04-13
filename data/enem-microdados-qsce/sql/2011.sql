-- NULL AS q_descricao_questao

SELECT
  md.id_inscricao,
  md.ensino,
  md.nota_ciencias_natureza,
  md.nota_ciencias_humanas,
  md.nota_linguagens_codigos,
  md.nota_matematica,
  md.nota_redacao,
  qs.Q002 AS q_formacao_pai,
  qs.Q003 AS q_formacao_mae,
  qs.Q004 AS q_renda_familia
FROM
  `basedosdados.br_inep_enem.microdados` AS md
INNER JOIN
  `basedosdados.br_inep_enem.questionario_socioeconomico_2011` AS qs
ON
  md.id_inscricao = qs.id_inscricao
WHERE 1=1
  AND qs.Q002 IS NOT NULL
  AND qs.Q003 IS NOT NULL
  AND qs.Q004 IS NOT NULL
  AND md.presenca_ciencias_humanas = '1'
  AND md.presenca_ciencias_natureza = '1'
  AND md.presenca_linguagens_codigos = '1'
  AND md.presenca_matematica = '1'
  AND md.presenca_redacao = 'P'
  AND md.ano = 2011;