mlir-opt atax-main.mlir --lower-affine --scf-for-to-while > atax-scf.mlir 

circt-opt atax-scf.mlir --lower-scf-to-calyx="top-level-function=main" > atax-calyx.mlir 

circt-translate --export-calyx atax-calyx.mlir 

rm atax-scf.mlir atax-calyx.mlir 