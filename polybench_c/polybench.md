| Design              | Works?      | Fully Static? | 
| :------------------ | :------     | :---- |
| correlation | N (sqrt) | n/a |
| covariance | Y | N |
| gemm     | Y | Y |
| gemver   | Y  | Y |
| gesummv  | Y | Y | 
| symm  | Y | N | 
| syr2k  | Y | N | 
| syrk  | Y| N | 
| trmm  | Y | N | 
| 2mm  | Y | Y | 
| 3mm  | Y | Y | 
| atax  | Y | Y | 
| bicg | Y | Y |
| doitgen | Y | Y | 
| mvt  | Y | Y | 
| cholesky  | N (sqrt) | n/a | 
| durbin  | Y | N | 
| gramschmidt  | N (sqrt) | n/a | 
| lu  | Y | N | 
| ludcmp  | Y | N | 
| trisolv  | Y | Y | 
| deriche  | N (exp) | n/a | 
| floyd-warshall | N(annoything arith.select) | n/a | 
| nussinov  | N (annoying things not supported arith.select, scf.if) | n/a | 
| adi  | N (divide by 0 b/c we use int)| n/a | 
| fdtd-2d  | Y | Y | 
| heat-3d  | N (computation not interesting (multiplies by 0.125 which rounds to 0)) | n/a | 
| jacobi-1d  | N (computation not interesting, mult by 0.33) | n/a | 
| jacobi-2d  | N (computation not interesting, mult by 0.2) | n/a | 
| seidel-2d  | Y | N | 