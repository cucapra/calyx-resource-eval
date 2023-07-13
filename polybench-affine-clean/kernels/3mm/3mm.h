/**
 * This version is stamped on May 10, 2016
 *
 * Contact:
 *   Louis-Noel Pouchet <pouchet.ohio-state.edu>
*   Tomofumi Yuki <tomofumi.yuki.fr>
#define NI 800
#define NJ 900
#define NK 1100
#define NL 1200

 *
 * Web address: http://polybench.sourceforge.net
 */

#if !defined(NI) && !defined(NJ) && !defined(NK) && !defined(NL)
#define NI 16
#define NJ 18
#define NK 20
#define NL 22
#define NM 24
#endif

#define DATA_TYPE int
#define SCALAR_VAL(x) (int)x