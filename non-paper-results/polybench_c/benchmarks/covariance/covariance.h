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

/* Default to LARGE_DATASET. */
#if !defined(MINI_DATASET) && !defined(SMALL_DATASET) &&                       \
    !defined(MEDIUM_DATASET) && !defined(LARGE_DATASET) &&                     \
    !defined(EXTRALARGE_DATASET)
#define LARGE_DATASET
#endif

#if !defined(M) && !defined(N)
/* Define sample dataset sizes. */
#ifdef MINI_DATASET
#define M 28
#define N 32
#endif

#ifdef SMALL_DATASET
#define M 80
#define N 100
#endif

#ifdef MEDIUM_DATASET
#define M 240
#define N 260
#endif

#ifdef LARGE_DATASET
#define M 1200
#define N 1400
#endif

#ifdef EXTRALARGE_DATASET
#define M 2600
#define N 3000
#endif

#endif /* !(M N) */

#define DATA_TYPE int
#define SCALAR_VAL(x) (int)x