-- Dados faltantes
select *
from despesas_dengue
where 0 IN("2020", "2019", "2018", "2017", "2020", "2016", "2015", "2014", "2013", "2011", "2010")
UNION
select *
from despesas_gerais
where 0 IN("2020", "2019", "2018", "2017", "2020", "2016", "2015", "2014", "2013", "2011", "2010")
UNION
select *
from esgoto_coletado
where 0 IN("2020", "2019", "2018", "2017", "2020", "2016", "2015", "2014", "2013", "2011", "2010")

-- Remoção da coluna 2010
-- Obs: não e necessário remover a coluna 2010 dos demais bancos, visto que será criada uma tabela
-- auxiliar sem tais dados
alter table esgoto_coletado
drop column "2010"

-- Tabela auxiliar com os dados de despesas_gerais - despesas_dengue
create view dif_despesas as
select dg.localidade, tipo,
dg."2020" - dd."2020" as "2020",
dg."2019" - dd."2019" as "2019",
dg."2018" - dd."2018" as "2018",
dg."2017" - dd."2017" as "2017",
dg."2016" - dd."2016" as "2016",
dg."2015" - dd."2015" as "2015",
dg."2014" - dd."2014" as "2014",
dg."2013" - dd."2013" as "2013",
dg."2012" - dd."2012" as "2012",
dg."2011" - dd."2011" as "2011"
from despesas_gerais dg, despesas_dengue dd, dg_localidade dl
where dg.localidade = dd.localidade
and dg.localidade = dl.localidade

-- Grafico Figura 8
select *
from dif_despesas
where tipo = 'país'

-- Grafico Figura 9
select *
from esgoto_coletado ec, dg_localidade dl
where ec.localidade = dl.localidade
and tipo = 'país'

-- Grafico Figura 6
select *
from dif_despesas
where tipo = 'região'

-- Grafico Figura 7 (a)
select *
from esgoto_coletado ec, dg_localidade dl
where ec.localidade = dl.localidade
and tipo = 'região'
and ec.localidade <> 'Sudeste'

-- Grafico Figura 7 (b)
select ("2020" - "2011")/10/("2011")*100 as "coef_ang esgoto coletado (%)"
from esgoto_coletado ec, dg_localidade dl
where ec.localidade = dl.localidade
and tipo = 'país'

-- Variação 2011-2020 das despesas
select ("2020" - "2011")/("2011")*100 as "variacao_total(%)"
from dif_despesas
where tipo = 'país'

-- Variação 2011-2020 da coleta
select ("2020" - "2011")/("2011")*100 as "variacao_total(%)"
from esgoto_coletado ec, dg_localidade dl
where ec.localidade = dl.localidade
and tipo = 'país'

-- Exclusão da tabela auxiliar
drop view dif_despesas