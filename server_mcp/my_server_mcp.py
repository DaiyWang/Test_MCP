# meu_servidor_template.py
# --- Imports ---
import re
from collections import Counter
from mcp.server.fastmcp.prompts import base
from mcp.server.fastmcp import FastMCP, Context

# 1. Inicialize o Servidor
mcp = FastMCP("MeuServidorMCP")
print(f"Servidor MCP '{mcp.name}' inicializado.")

# --- RESOURCES (InformaÃ§Ãµes de Contexto para a IA) ---

@mcp.resource("meuMCP://about") # URI estÃ¡tica que o cliente pode solicitar
def get_assistant_capabilities() -> str:
    """Descreve as principais ferramentas e o propÃ³sito deste assistente."""
    print("-> Resource 'meuMCP://about' solicitado pelo cliente.")
    capabilities = """
    Eu sou um assistente de exemplo baseado no servidor 'MeuServidorMCP'. Minhas principais capacidades (ferramentas que posso usar) sÃ£o:
    1.  **Contar FrequÃªncia de Palavras:** Analisar um texto e contar quantas vezes cada palavra aparece.
    2.  **Extrair URLs:** Encontrar links (http/https) dentro de um texto.
    3.  **Recomendar Site:** Posso te indicar um Ã³timo site para aprender sobre IA.
    4.  **Registrar Logs:** Posso registrar mensagens internamente (Ãºtil para depuraÃ§Ã£o).

    Use-me para processar textos ou obter a recomendaÃ§Ã£o do site!
    """
    print("   [meuMCP://about] DescriÃ§Ã£o das capacidades retornada.")
    return capabilities.strip()