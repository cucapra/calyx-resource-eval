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
#define LARGE_DATASET
#endif

#if !defined(TSTEPS) && !defined(N)
/* Define sample dataset sizes. */
#ifdef MINI_DATASET
#define TSTEPS 20
#define N 40
#endif

#ifdef SMALL_DATASET
#define TSTEPS 40
#define N 120
#endif

#ifdef MEDIUM_DATASET
#define TSTEPS 100
#define N 400
#endif

#ifdef LARGE_DATASET
#define TSTEPS 500
#define N 2000
#endif

#ifdef EXTRALARGE_DATASET
#define TSTEPS 1000
#define N 4000
#endif

#endif /* !(TSTEPS N) */

#define DATA_TYPE int
#define SCALAR_VAL(x) (int)x