# instalar o pacote
install.packages("neuralnet")
# Criando conjunto de dados de treinamento
conhecimento = c(20,10,30,20,80,30)
comunicacao = c(90,20,40,50,50,80)
aprovacao = c(1,0,0,0,1,1)
# Aqui, você combinará várias colunas ou recursos em um único conjunto
# de dados ou data frame
df = data.frame(conhecimento, comunicacao, aprovacao)
# Carregar biblioteca
library("neuralnet")
# Construir a RNA
rna = neuralnet(aprovacao~conhecimento+comunicacao,data = df, hidden =
                  3, act.fct = "logistic", linear.output = FALSE)
# Desenhar a rede neural
plot(rna)
# Criando o conjunto de teste
conhe = c(30,40,85)
comu = c(85,50,40)
teste = data.frame(conhe, comu)
# Predição usando a rede neural
previsao = compute(rna, teste)
previsao $ net.result
# Convertendo probabilidades em classes binárias definindo nível
# limiar 0,5
prob <- previsao $ net.result
resposta <- ifelse(prob >0.5, 1, 0)
resposta
