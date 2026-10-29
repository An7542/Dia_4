KEYWORD="PySide6"
PY_DIR="$DEST_DIR/py"

total_py_files=0
matched_py_files=0

echo "=== Auditoría de Código (.py) ==="

if [ -d "$PY_DIR" ]; then
    for py_file in "$PY_DIR"/*.py; do
        # Manejar el caso en que no haya archivos .py en la carpeta
        [ -e "$py_file" ] || continue

        ((total_py_files++))
        echo "--------------------------------------------------"
        echo "Ubicación: $py_file"

        # Verificar presencia de la palabra clave
        if grep -q "$KEYWORD" "$py_file"; then
            echo "Contiene '$KEYWORD': SÍ"
            echo "Coincidencias encontradas:"
            grep -n "$KEYWORD" "$py_file"
            ((matched_py_files++))
        else
            echo "Contiene '$KEYWORD': NO"
        fi
    done
else
    echo "No se encontraron archivos .py organizados en el destino."
fi

# Resumen Final
echo "--------------------------------------------------"
echo "=== Resumen Final ==="
echo "Total de archivos .py analizados: $total_py_files"
echo "Archivos que utilizan $KEYWORD: $matched_py_files"
