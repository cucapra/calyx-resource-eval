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

#if !defined(M) && !defined(N)
/* Define sample dataset sizes. */
#ifdef MINI_DATASET
#define M 20
#define N 30
#endif

#ifdef SMALL_DATASET
#define M 60
#define N 80
#endif

#ifdef MEDIUM_DATASET
#define M 200
#define N 240
#endif

#ifdef LARGE_DATASET
#define M 1000
#define N 1200
#endif

#ifdef EXTRALARGE_DATASET
#define M 2000
#define N 2600
#endif

#endif /* !(M N) */

#define DATA_TYPE int
#define SCALAR_VAL(x) (int)x