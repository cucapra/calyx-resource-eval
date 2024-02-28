/**
 * This version is stamped on May 10, 2016
 *
 * Contact:
 *   Louis-Noel Pouchet <pouchet.ohio-state.edu>
 *   Tomofumi Yuki <tomofumi.yuki.fr>
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
#define M 38
#define N 42
#endif

#ifdef SMALL_DATASET
#define M 116
#define N 124
#endif

#ifdef MEDIUM_DATASET
#define M 390
#define N 410
#endif

#ifdef LARGE_DATASET
#define M 1900
#define N 2100
#endif

#ifdef EXTRALARGE_DATASET
#define M 1800
#define N 2200
#endif

#endif /* !(M N) */

#define DATA_TYPE int
#define SCALAR_VAL(x) (int)x