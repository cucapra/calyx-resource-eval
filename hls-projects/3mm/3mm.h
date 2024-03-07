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

#if !defined(NI) && !defined(NJ) && !defined(NK) && !defined(NL) && !defined(NM)
/* Define sample dataset sizes. */
#ifdef MINI_DATASET
#define NI 16
#define NJ 18
#define NK 20
#define NL 22
#define NM 24
#endif

#ifdef SMALL_DATASET
#define NI 40
#define NJ 50
#define NK 60
#define NL 70
#define NM 80
#endif

#ifdef MEDIUM_DATASET
#define NI 180
#define NJ 190
#define NK 200
#define NL 210
#define NM 220
#endif

#ifdef LARGE_DATASET
#define NI 800
#define NJ 900
#define NK 1000
#define NL 1100
#define NM 1200
#endif

#ifdef EXTRALARGE_DATASET
#define NI 1600
#define NJ 1800
#define NK 2000
#define NL 2200
#define NM 2400
#endif

#endif /* !(NI NJ NK NL NM) */
#define DATA_TYPE int
#define SCALAR_VAL(x) (int)x