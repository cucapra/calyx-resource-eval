design_name=${1:-''}

mlir-opt $design_name-main.mlir --lower-affine --scf-for-to-while > $design_name-scf.mlir 

circt-opt $design_name-scf.mlir --lower-scf-to-calyx="top-level-function=main" > $design_name-calyx.mlir 

circt-translate --export-calyx $design_name-calyx.mlir 

rm $design_name-scf.mlir $design_name-calyx.mlir 