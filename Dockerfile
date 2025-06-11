# Use uma imagem base Python adequada
FROM python:3.10-slim-buster

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo requirements.txt primeiro para aproveitar o cache do Docker
COPY requirements.txt .

# Instala as dependências usando pip (como corrigimos anteriormente)
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da sua aplicação
# Certifique-se de que `myservermcp.py` esteja no diretório raiz do contexto de build
# ou ajuste o caminho de cópia conforme a estrutura do seu projeto.
COPY . .

# Expõe a porta que o servidor FastMCP irá usar
EXPOSE 8080

# Define o comando que será executado quando o contêiner for iniciado
# Isso iniciará seu servidor FastMCP
CMD ["python", "myservermcp.py"]
