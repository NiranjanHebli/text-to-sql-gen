from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    """
    Application settings and environment variables.
    """

    model_config = SettingsConfigDict(env_file=".env", env_file_encoding="utf-8")

    # Database Settings
    db_uri: str = "postgresql://user:password@localhost:5432/mydb"
    db_timeout_seconds: int = 15

    # Ollama Settings
    ollama_base_url: str = "http://localhost:11434"
    sql_model: str = "qwen2.5-coder:7b"
    critic_model: str = "deepseek-r1:7b"
    embed_model: str = "nomic-embed-text:latest"

    # Vector Store Settings
    vector_store_type: str = "chromadb"  # 'chromadb' or 'pgvector'
    chroma_persist_dir: str = "./chroma_db"

    # Langfuse Observability Settings
    langfuse_secret_key: str | None = None
    langfuse_public_key: str | None = None
    langfuse_host: str = "https://cloud.langfuse.com"


settings = Settings()
