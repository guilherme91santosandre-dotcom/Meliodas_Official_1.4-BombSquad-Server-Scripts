FROM ubuntu:20.04

# Evitar perguntas durante instalação
ENV DEBIAN_FRONTEND=noninteractive

# Atualizar e instalar dependências
RUN apt-get update && apt-get install -y \
    python2 \
    libsdl2-2.0-0 \
    libpython2.7 \
    tmux \
    && apt-get clean

# Criar diretório do servidor
WORKDIR /server

# Copiar todos os arquivos do repositório
COPY . /server/

# Dar permissão aos arquivos necessários
RUN chmod 777 bs_headless && \
    chmod 777 bombsquad_server && \
    chmod 777 bscfg/config.json

# A porta que o BombSquad usa
EXPOSE 43210/udp
EXPOSE 43210/tcp

# Comando de inicialização
CMD ["./bombsquad_server"]
