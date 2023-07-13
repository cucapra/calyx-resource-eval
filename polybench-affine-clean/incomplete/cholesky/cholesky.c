#include "cholesky.h"
#include <math.h>

DATA_TYPE A[N][N];

// https://www.geeksforgeeks.org/square-root-of-an-integer/
// void floorSqrt(int x, int ans) {
//   // Base cases
//   if (x == 0 || x == 1)
//     ans = x;
//   else {
//     // Do Binary Search for floor(sqrt(x))
//     int start = 1, end = x / 2;
//     while (start <= end) {
//       int mid = (start + end) / 2;

// If x is a perfect square
// int sqr = mid * mid;
// if (sqr == x) {
//   ans = mid;
//   start = mid + 1;
// }

// Since we need floor, we update answer when
// mid*mid is smaller than x, and move closer to
// sqrt(x)

/*
   if(mid*mid<=x)
           {
                   start = mid+1;
                   ans = mid;
           }
    Here basically if we multiply mid with itself so
   there will be integer overflow which will throw
   tle for larger input so to overcome this
   situation we can use long or we can just divide
    the number by mid which is same as checking
   mid*mid < x

   */
//       if (sqr <= x) {
//         start = mid + 1;
//         ans = mid;
//       } else // If mid*mid is greater than x
//         end = mid - 1;
//     }
//   }
// }

/* Main computational kernel. The whole function will be timed,
   including the call and return. */
static void kernel_cholesky_partial(int n, DATA_TYPE A[N][N]) {
  int i, j, k;

#pragma scop
  for (i = 0; i < N; i++) {
    // j<i
    for (j = 0; j < i; j++) {
      for (k = 0; k < j; k++) {
        A[i][j] -= A[i][k] * A[j][k];
      }
      A[i][j] /= A[j][j];
    }
    // i==j case
    for (k = 0; k < i; k++) {
      A[i][i] -= A[i][k] * A[i][k];
    }
    A[i][i] = A[i][i] + 75;
  }
#pragma endscop
}

static void kernel_cholesky(int n, DATA_TYPE A[N][N]) {
  int i, j, k;

#pragma scop
  for (i = 0; i < N; i++) {
    // j<i
    for (j = 0; j < i; j++) {
      for (k = 0; k < j; k++) {
        A[i][j] -= A[i][k] * A[j][k];
      }
      A[i][j] /= A[j][j];
    }
    // i==j case
    for (k = 0; k < i; k++) {
      A[i][i] -= A[i][k] * A[i][k];
    }
    A[i][i] = (int)sqrt(A[i][i]);
  }
#pragma endscop
}
