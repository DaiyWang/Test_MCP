# Dockerfile para o servidor MCP de previsão do tempo em Python

# Use uma imagem base Python oficial.
# Preferimos uma versão slim para um tamanho de imagem menor.
FROM python:3.10-slim-buster

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia o arquivo de requisitos para o diretório de trabalho
# Isso é feito separadamente para aproveitar o cache do Docker,
# caso as dependências não mudem com frequência.
COPY requirements.txt .

# Instala as dependências especificadas no requirements.txt
# Certifique-se de que 'uv' seja instalado para gerenciar o ambiente e as dependências
# O 'uv' é uma ferramenta rápida e moderna para pacotes Python.
# O 'pip' é usado aqui para instalar o 'uv' globalmente no container.
# As dependências do projeto são então instaladas via 'uv'.
RUN pip install uv && \
    uv pip install -r requirements.txt

# Copia o restante do código da aplicação para o diretório de trabalho
COPY myservermcp.py .

# Comando para iniciar o servidor MCP quando o container for executado
# O servidor será executado com o transporte 'stdio', o que é necessário para a integração com o Claude for Desktop.
CMD ["uv", "run", "myservermcp.py"]
