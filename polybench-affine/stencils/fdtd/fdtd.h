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

/* Default to LARGE_DATASET. */
#if !defined(MINI_DATASET) && !defined(SMALL_DATASET) &&                       \
    !defined(MEDIUM_DATASET) && !defined(LARGE_DATASET) &&                     \
    !defined(EXTRALARGE_DATASET)
#define MINI_DATASET
#endif

#if !defined(TMAX) && !defined(NX) && !defined(NY)
/* Define sample dataset sizes. */
#ifdef MINI_DATASET
#define TMAX 20
#define NX 20
#define NY 30
#endif

#ifdef SMALL_DATASET
#define TMAX 40
#define NX 60
#define NY 80
#endif

#ifdef MEDIUM_DATASET
#define TMAX 100
#define NX 200
#define NY 240
#endif

#ifdef LARGE_DATASET
#define TMAX 500
#define NX 1000
#define NY 1200
#endif

#ifdef EXTRALARGE_DATASET
#define TMAX 1000
#define NX 2000
#define NY 2600
#endif

#endif /* !(TMAX NX NY) */

#define DATA_TYPE int
#define SCALAR_VAL(x) (int)x