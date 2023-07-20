#include <iostream>

using namespace std;

// // https://www.geeksforgeeks.org/square-root-of-an-integer/
// int floorSqrt(int x) {
//   int ans = 0;
//   // Base cases
//   if (x == 0 || x == 1)
//     ans = x;
//   else {
//     int start = 1, end = x / 2;
//     while (start <= end) {
//       int mid = (start + end) / 2;

//       // If x is a perfect square
//       int sqr = mid * mid;
//       if (sqr == x) {
//         ans = mid;
//         start = end + 1;
//       } else if (sqr <= x) {
//         start = mid + 1;
//         ans = mid;
//       } else // If mid*mid is greater than x
//         end = mid - 1;
//     }
//   }
//   // Do Binary Search for floor(sqrt(x))
// }

// Driver program
int main() {
  int x = 0;
  int ans = 0;
  if (x == 0 || x == 1)
    ans = x;
  else {
    int start = 1, end = x / 2;
    while (start <= end) {
      int mid = (start + end) / 2;

      // If x is a perfect square
      int sqr = mid * mid;
      if (sqr == x) {
        ans = mid;
        start = end + 1;
      } else if (sqr <= x) {
        start = mid + 1;
        ans = mid;
      } else // If mid*mid is greater than x
        end = mid - 1;
    }
  }
  cout << ans << endl;
  return 0;
}
