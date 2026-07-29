# Agentic Text-to-SQL System

## Problem Statement
Organizations often struggle with extracting actionable insights from relational databases, as it traditionally requires specialized SQL expertise. Business users, analysts, and executives must rely on data engineering teams to write queries for ad-hoc questions. This leads to bottlenecks, delayed decision-making, and high operational overhead. Conversely, existing cloud-based AI solutions (like OpenAI or Anthropic) introduce severe data privacy concerns, compliance risks, and unpredictable recurring costs by transmitting sensitive schema and query context to third-party providers.

## Use Case
This system is an **Agentic Text-to-SQL assistant** designed to empower business analysts and operations staff to query databases using natural language (e.g., "What were our total sales in Q3 by region?"). 

Crucially, it operates on a **100% local, open-source AI stack**. Using local models via Ollama, it ensures zero recurring AI API costs and guarantees that no data or schema information ever leaves the organization's secure infrastructure. It utilizes a stateful multi-agent workflow (Planning, Retrieval, Generation, Validation, Critique) to self-correct errors and enforce read-only safety prior to execution.

## Prerequisites
- **Python 3.11+**
- **uv**: Extremely fast Python package installer and resolver.
- **Ollama**: For running local LLMs and embedding models.
- **Git**: For version control.
- **Docker / Docker Compose** (Optional): For running Langfuse, ChromaDB, or target databases locally.

## General Setup

1. **Clone the repository**
   ```bash
   git clone git@github.com:NiranjanHebli/text-to-sql-gen.git
   cd text-to-sql-gen
   ```

2. **Run the setup script**
   We provide a convenience script that automatically installs `uv` (if missing), synchronizes the Python dependencies, and configures the local Git hooks for code quality checks.
   ```bash
   ./setup.sh
   ```

3. **Install and Configure Ollama**
   Download [Ollama](https://ollama.com/) and pull the necessary models required for the agent workflow:
   ```bash
   ollama pull qwen2.5-coder:7b
   ollama pull deepseek-r1:7b
   ollama pull nomic-embed-text:latest
   ```

4. **Environment Variables**
   Create an environment file using the `.env.example` template (create `.env` if it doesn't exist) and update it with your database credentials and Langfuse tracking keys.
   ```bash
   cp .env.example .env
   ```
   *(Note: Ensure your `db_uri` points to a database role with STRICTLY read-only privileges).*
