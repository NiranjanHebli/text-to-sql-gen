#!/usr/bin/env bash
set -e

echo "Setting up the Agentic Text-to-SQL project environment..."

# 1. Check for uv
if ! command -v uv &> /dev/null; then
    echo "uv could not be found. Installing uv..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    export PATH="$HOME/.cargo/bin:$PATH"
fi

# 2. Sync dependencies using uv
echo "Syncing dependencies using uv (this reads pyproject.toml)..."
uv sync

# 3. Setup custom git hooks
echo "Installing git hooks..."
cp githooks/pre-commit .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit

echo "Setup complete! Your environment is ready. Run 'uv run python src/core/__init__.py' or similar to test."
