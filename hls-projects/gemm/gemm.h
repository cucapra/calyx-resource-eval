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
#define MEDIUM_DATASET
#endif

#if !defined(NI) && !defined(NJ) && !defined(NK)
/* Define sample dataset sizes. */
#ifdef MINI_DATASET
#define NI 20
#define NJ 25
#define NK 30
#endif

#ifdef SMALL_DATASET
#define NI 60
#define NJ 70
#define NK 80
#endif

#ifdef MEDIUM_DATASET
#define NI 200
#define NJ 220
#define NK 240
#endif

#ifdef LARGE_DATASET
#define NI 1000
#define NJ 1100
#define NK 1200
#endif

#ifdef EXTRALARGE_DATASET
#define NI 2000
#define NJ 2300
#define NK 2600
#endif

#endif /* !(NI NJ NK) */

#define DATA_TYPE int
#define SCALAR_VAL(x) (int)x