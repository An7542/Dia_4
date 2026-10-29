

# 1. Verificar exactamente 2 argumentos
if [ "$#" -ne 2 ]; then
    echo "Uso: ./script.sh <archivo.zip> <directorio_destino>"
    exit 1
fi

ZIP_FILE="$1"
DEST_DIR="$2"

# 2. Comprobar que el archivo .zip exista
if [ ! -f "$ZIP_FILE" ]; then
    echo "Error: El archivo '$ZIP_FILE' no existe."
    exit 1
fi
