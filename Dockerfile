FROM node:18-alpine

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia os arquivos de configuração do projeto
COPY package.json yarn.lock ./

# Instala as dependências
RUN yarn install --production

# Copia apenas a pasta dist para o contêiner
COPY ./dist .

# Expõe a porta em que o aplicativo estará escutando
EXPOSE 3000

# Define o comando padrão para iniciar o aplicativo
CMD [  "yarn", "run", "start:prod" ]

