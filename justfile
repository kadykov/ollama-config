default:
    @just --list

# Stop and remove existing ollama container if it exists
stop:
    docker stop ollama 2>/dev/null || true
    docker rm ollama 2>/dev/null || true

# Start ollama server
serve:
    @just stop
    docker run -d \
    -v ollama:/root/.ollama \
    -p 11434:11434 \
    --name ollama ollama/ollama serve

# Exectute ollama command
ollama COMMAND *ARGS='':
    docker exec -it ollama ollama {{COMMAND}} {{ARGS}}
