#include <iostream>
#include <math.h>
using namespace std;

int divisors_sum(int number) {
  int sum = 1;
  int lim = (int) sqrt(number);
  for (int x = 2; x <= lim; x++) {
    if (number % x == 0) {
      sum += x;
      sum += number / x;
    }
  }
  return sum;
}

bool amicable_pair(int num1, int num2) {
  return divisors_sum(num1) == num2 && divisors_sum(num2) == num1;
}

int solver(int from, int to) {
  int sum = 0;
  
  for (int x = from; x <= to; x++) {
    int y = divisors_sum(x);
    if (y > x) {
      if (amicable_pair(x, y)) {
        cout << "(" << x << ", " << y << ")" << endl;
        sum += (x + y);
      }
    }
  }
  
  return sum;
}

int main() {
  cout << solver(1, 100000) << endl;
}
