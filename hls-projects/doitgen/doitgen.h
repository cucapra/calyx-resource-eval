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

#if !defined(NQ) && !defined(NR) && !defined(NP)
/* Define sample dataset sizes. */
#ifdef MINI_DATASET
#define NQ 8
#define NR 10
#define NP 12
#endif

#ifdef SMALL_DATASET
#define NQ 20
#define NR 25
#define NP 30
#endif

#ifdef MEDIUM_DATASET
#define NQ 40
#define NR 50
#define NP 60
#endif

#ifdef LARGE_DATASET
#define NQ 140
#define NR 150
#define NP 160
#endif

#ifdef EXTRALARGE_DATASET
#define NQ 220
#define NR 250
#define NP 270
#endif

#endif /* !(NQ NR NP) */

#define DATA_TYPE int
#define SCALAR_VAL(x) (int)x