design_name=$1
bounded=$2

cgeist "$design_name-main.c" -S > "$design_name.mlir"

sed -i 's/attributes {[^{}]*}//g' "$design_name.mlir"

# Generate mlir scf file.
# Check if the 'bounded' variable is set
if [ "$bounded" -eq 0 ]; then
    # If 'bounded' is false, add '--scf-for-to-while' option
    mlir-opt "$design_name.mlir" --lower-affine --scf-for-to-while > "$design_name-scf.mlir"
else
    # If 'bounded' is true, don't add '--scf-for-to-while' option
    mlir-opt "$design_name.mlir" --lower-affine > "$design_name-scf.mlir"
fi

# Generate the mlir calyx file.
circt-opt $design_name-scf.mlir --lower-scf-to-calyx="top-level-function=main" -canonicalize > $design_name-calyx.mlir

# Generate the native calyx file.
circt-translate --export-calyx $design_name-calyx.mlir > "$design_name.futil"

count=$(grep -c "component" "$design_name.futil")
if [ "$count" -gt 1 ]; then
    # Find the line numbers of the first and last occurrences of "component"
    start_line=$(grep -n 'component' $design_name.futil | head -n 1 | cut -d ':' -f 1)
    end_line=$(grep -n 'component' $design_name.futil | tail -n 1 | cut -d ':' -f 1)
    end_line=$((end_line - 1))
    # Delete lines between the first and last occurrences of "component"
    sed -i "${start_line},${end_line}d" "$design_name.futil"
fi

cat $design_name.futil

# Remove the scf and calyx files.
rm $design_name.mlir $design_name-scf.mlir $design_name-calyx.mlir $design_name.futil
