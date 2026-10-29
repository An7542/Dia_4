# Crear directorio de destino si no existe
mkdir -p "$DEST_DIR"

# Crear directorio temporal
TEMP_DIR=$(mktemp -d)

# Asegurar la eliminación de la carpeta temporal al finalizar o cancelar el script
trap 'rm -rf "$TEMP_DIR"' EXIT

# Descomprimir en carpeta temporal
unzip -q "$ZIP_FILE" -d "$TEMP_DIR"

# Recorrer archivos y organizarlos en subcarpetas por extensión
find "$TEMP_DIR" -type f | while read -r filepath; do
    filename=$(basename "$filepath")
    extension="${filename##*.}"

    # Asignar subcarpeta según extensión o 'otros' si carece de ella
    if [ "$filename" = "$extension" ]; then
        ext_dir="otros"
    else
        ext_dir=$(echo "$extension" | tr '[:upper:]' '[:lower:]')
    fi

    target_folder="$DEST_DIR/$ext_dir"
    mkdir -p "$target_folder"
    cp "$filepath" "$target_folder/"
done
