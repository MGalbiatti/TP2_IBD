-- Table: public.dg_localidade

-- DROP TABLE IF EXISTS public.dg_localidade;

CREATE TABLE IF NOT EXISTS public.dg_localidade
(
    localidade character(30) COLLATE pg_catalog."default" NOT NULL,
    tipo character(10) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT dg_localidade_pkey PRIMARY KEY (localidade)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.dg_localidade
    OWNER to postgres;

COMMENT ON TABLE public.dg_localidade
    IS 'Tipo de delimitação geográfica da localidade.';

COMMENT ON COLUMN public.dg_localidade.localidade
    IS 'Nome do local.';

COMMENT ON COLUMN public.dg_localidade.tipo
    IS 'Tipo da localidade, podendo ser: país, unidade federativa (uf) ou região.';

INSERT INTO dg_localidade(localidade,tipo) VALUES ('Brasil','país');
INSERT INTO dg_localidade(localidade,tipo) VALUES ('Norte','região');
INSERT INTO dg_localidade(localidade,tipo) VALUES ('Nordeste','região');
INSERT INTO dg_localidade(localidade,tipo) VALUES ('Sudeste','região');
INSERT INTO dg_localidade(localidade,tipo) VALUES ('Sul','região');
INSERT INTO dg_localidade(localidade,tipo) VALUES ('Centro-Oeste','região');
INSERT INTO dg_localidade(localidade,tipo) VALUES ('Rondônia','uf');
INSERT INTO dg_localidade(localidade,tipo) VALUES ('Acre','uf');
INSERT INTO dg_localidade(localidade,tipo) VALUES ('Amazonas','uf');
INSERT INTO dg_localidade(localidade,tipo) VALUES ('Roraima','uf');
INSERT INTO dg_localidade(localidade,tipo) VALUES ('Pará','uf');
INSERT INTO dg_localidade(localidade,tipo) VALUES ('Amapá','uf');
INSERT INTO dg_localidade(localidade,tipo) VALUES ('Tocantins','uf');
INSERT INTO dg_localidade(localidade,tipo) VALUES ('Maranhão','uf');
INSERT INTO dg_localidade(localidade,tipo) VALUES ('Piauí','uf');
INSERT INTO dg_localidade(localidade,tipo) VALUES ('Ceará','uf');
INSERT INTO dg_localidade(localidade,tipo) VALUES ('Rio Grande do Norte','uf');
INSERT INTO dg_localidade(localidade,tipo) VALUES ('Paraíba','uf');
INSERT INTO dg_localidade(localidade,tipo) VALUES ('Pernambuco','uf');
INSERT INTO dg_localidade(localidade,tipo) VALUES ('Alagoas','uf');
INSERT INTO dg_localidade(localidade,tipo) VALUES ('Sergipe','uf');
INSERT INTO dg_localidade(localidade,tipo) VALUES ('Bahia','uf');
INSERT INTO dg_localidade(localidade,tipo) VALUES ('Minas Gerais','uf');
INSERT INTO dg_localidade(localidade,tipo) VALUES ('Espírito Santo','uf');
INSERT INTO dg_localidade(localidade,tipo) VALUES ('Rio de Janeiro','uf');
INSERT INTO dg_localidade(localidade,tipo) VALUES ('São Paulo','uf');
INSERT INTO dg_localidade(localidade,tipo) VALUES ('Paraná','uf');
INSERT INTO dg_localidade(localidade,tipo) VALUES ('Santa Catarina','uf');
INSERT INTO dg_localidade(localidade,tipo) VALUES ('Rio Grande do Sul','uf');
INSERT INTO dg_localidade(localidade,tipo) VALUES ('Mato Grosso do Sul','uf');
INSERT INTO dg_localidade(localidade,tipo) VALUES ('Mato Grosso','uf');
INSERT INTO dg_localidade(localidade,tipo) VALUES ('Goiás','uf');
INSERT INTO dg_localidade(localidade,tipo) VALUES ('Distrito Federal','uf');
