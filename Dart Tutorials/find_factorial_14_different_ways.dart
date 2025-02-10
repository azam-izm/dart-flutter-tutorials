/*
  Topic: Mastering Factorial in Dart: 14 Unique Methods
  Description: 
  This program demonstrates 14 different ways to calculate the factorial of a number in Dart.
  Methods include recursion, iteration, functional programming, async computations, isolates, and more.

  Factorial Definition
  Factorial of a number 𝑛 is: n!=n×(n−1)×(n−2)×⋯×1
  For example:
  4!=4×3×2×1=24
  3!=3×2×1=6
  2!=2×1=2
  1!=1
  0!=1 (by definition)
*/

import 'dart:isolate';
import 'dart:async';

void main() async {
  int num = 4; // Change this value to test different numbers

  print("1. Recursive Factorial: ${factorialRecursive(num)}");
  print("2. Tail Recursive Factorial: ${factorial(num)}");
  print("3. Iterative Factorial (For Loop): ${factorialIterative(num)}");
  print("4. While Loop Factorial: ${factorialWhile(num)}");
  print("5. Functional Reduce Factorial: ${factorialReduce(num)}");
  print("6. Functional Fold Factorial: ${factorialFold(num)}");
  print("7. Generator Function Factorial: ${factorialGen(num).first}");
  print("8. Memoized Factorial: ${factorialMemoized(num)}");

  await for (var value in factorialStream(num)) {
    print("9. Stream Factorial Value: $value");
  }
  print("10. Extension Method Factorial: ${num.factorial}");
  print("11. BigInt Factorial: ${factorialBigInt(BigInt.from(num))}");

  await for (var value in factorialAsync(num)) {
    print("12. Async Generator Factorial Value: $value");
  }
  print("13. Future Async Factorial: ${await factorialFuture(num)}");

  final receivePort = ReceivePort();
  await Isolate.spawn(factorialIsolate, receivePort.sendPort);
  receivePort.listen((message) {
    print("14. Isolate Factorial: $message");
    receivePort.close();
  });
}

// 1. Recursive Approach
int factorialRecursive(int n) => (n <= 1) ? 1 : n * factorialRecursive(n - 1);

// 2. Tail Recursion
int factorialTail(int n, int acc) => (n <= 1) ? acc : factorialTail(n - 1, acc * n);
int factorial(int n) => factorialTail(n, 1);

// 3. Iterative Approach
int factorialIterative(int n) {
  int result = 1;
  for (int i = 2; i <= n; i++) result *= i;
  return result;
}

// 4. While Loop
int factorialWhile(int n) {
  int result = 1;
  while (n > 1) result *= n--;
  return result;
}

// 5. Functional Reduce Approach
int factorialReduce(int n) => (n == 0) ? 1 : List.generate(n, (i) => i + 1).reduce((a, b) => a * b);

// 6. Functional Fold Approach
int factorialFold(int n) => (n == 0) ? 1 : List.generate(n, (i) => i + 1).fold(1, (a, b) => a * b);

// 7. Generator Function
Iterable<int> factorialGen(int n) sync* {
  yield (n == 0 || n == 1) ? 1 : n * factorialGen(n - 1).first;
}

// 8. Memoization
Map<int, int> cache = {};
int factorialMemoized(int n) => cache[n] ??= (n <= 1 ? 1 : n * factorialMemoized(n - 1));

// 9. Using Stream
Stream<int> factorialStream(int n) async* {
  int result = 1;
  for (int i = 1; i <= n; i++) {
    result *= i;
    yield result;
  }
}

// 10. Extension on int
extension Factorial on int {
  int get factorial => (this == 0 || this == 1) ? 1 : this * (this - 1).factorial;
}

// 11. Using BigInt for Large Numbers
BigInt factorialBigInt(BigInt n) => (n <= BigInt.one) ? BigInt.one : n * factorialBigInt(n - BigInt.one);

// 12. Async Generator
Stream<BigInt> factorialAsync(int n) async* {
  BigInt result = BigInt.one;
  for (int i = 1; i <= n; i++) {
    result *= BigInt.from(i);
    yield result;
  }
}

// 13. Using Future (Async Factorial)
Future<int> factorialFuture(int n) async => (n <= 1) ? 1 : n * await factorialFuture(n - 1);

// 14. Using Isolates for Parallel Processing
void factorialIsolate(SendPort sendPort) {
  int num = 4; // Modify as needed
  int result = 1;
  for (int i = 2; i <= num; i++) result *= i;
  sendPort.send(result);
}