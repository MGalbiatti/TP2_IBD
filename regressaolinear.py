# %%
from sqlalchemy import create_engine, text
import matplotlib.pyplot as plt
import pandas as pd
from sklearn.linear_model import LinearRegression
import numpy as np

# %%
# Conexão com o banco de dados, alocado no PostgreSQL
engine = create_engine("postgresql://postgres:1234@localhost/teste")
conn = engine.connect()

# %%

# Consulta referente à tabela auxiliar dif_despesas
consulta_desp = text("select \"2011\", \"2012\", \"2013\", \"2014\", \"2015\",\
                     \"2016\", \"2017\", \"2018\", \"2019\", \"2020\"\
                     from dif_despesas\
                     where tipo = 'país';")
df_desp = pd.read_sql(consulta_desp, engine)

# Consulta referente à tabela auxiliar esgoto_coletado
consulta_col = text("select \"2011\", \"2012\", \"2013\", \"2014\", \"2015\",\
                     \"2016\", \"2017\", \"2018\", \"2019\", \"2020\"\
                    from esgoto_coletado ec, dg_localidade dl\
                    where ec.localidade = dl.localidade\
                    and tipo = 'país';")
df_col = pd.read_sql(consulta_col, engine)

# Encerramento da conexão com o banco de dados
conn.close()

# Criação de tabela de 1 à 10 para representar os anos no processo de regressão linear
myRange = np.arange(1,11,1)
df = pd.DataFrame({"anos": myRange})

# Preparação dos dados de despesas para aplicar ao modelo de regressão linear
x = df["anos"].values.reshape(-1,1)
y = df_desp.values.reshape(-1,1)

# Modelo de regressão linear aplicado aos dados de despesas
reg = LinearRegression()
reg.fit(x, y)
previsoes = reg.predict(x)

# Gráfico do modelo gerado - despesas com doenças de transmissão hídrica, sem a dengue
plt.figure(figsize = (16,8))
plt.scatter(df['anos'], df_desp, c='red')
plt.plot(df['anos'], previsoes, c='blue', linewidth=2)
plt.xlabel("Ano")
plt.ylabel("Despesas")
plt.show()

# Coefiecente angular da reta, transformado em % baseado no ano de 2011
reg.coef_/df_desp["2011"].values*100

# Preparação dos dados de coleta para aplicar ao modelo de regressão linear
x = df["anos"].values.reshape(-1,1)
y = df_col.values.reshape(-1,1)

# Modelo de regressão linear aplicado aos dados de coleta
reg = LinearRegression()
reg.fit(x, y)
previsoes = reg.predict(x)

# Gráfico do modelo gerado - coleta de esgoto
plt.figure(figsize = (16,8))
plt.scatter(df['anos'], df_col, c='red')
plt.plot(df['anos'], previsoes, c='blue', linewidth=2)
plt.xlabel("Ano")
plt.ylabel("Coleta")
plt.show()

# Coefiecente angular da reta, transformado em % baseado no ano de 2011
reg.coef_/df_col["2011"].values*100
