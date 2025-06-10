# Usa imagem leve do Python
FROM python:3.11-alpine

# Define o diretório de trabalho
WORKDIR /app

# Copia o arquivo de dependências primeiro
COPY requirements.txt ./

# Instala as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código
COPY . .

# Expõe a porta
EXPOSE 6274

# Define variáveis de ambiente
ENV PYTHONUNBUFFERED=1

# CORREÇÃO: Usar main.py ao invés de myservermcp.py
CMD ["python", "main.py"]
