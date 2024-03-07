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
#define MEDIUM_DATASET
#endif

#if !defined(N)
/* Define sample dataset sizes. */
#ifdef MINI_DATASET
#define N 40
#endif

#ifdef SMALL_DATASET
#define N 120
#endif

#ifdef MEDIUM_DATASET
#define N 400
#endif

#ifdef LARGE_DATASET
#define N 2000
#endif

#ifdef EXTRALARGE_DATASET
#define N 4000
#endif

#endif /* !(N) */

#define DATA_TYPE int
#define SCALAR_VAL(x) (int)x