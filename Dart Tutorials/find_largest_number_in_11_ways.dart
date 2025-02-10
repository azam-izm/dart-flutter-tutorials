import 'dart:math';

void main() {
  final numbers = [3, 7, 2, 9, 5];
  
  // 1. Basic for loop with index
  int basicForMax = numbers.first;
  for (int i = 0; i < numbers.length; i++) {
    if (numbers[i] > basicForMax) {
      basicForMax = numbers[i];
    }
  }
  print('1. (Basic for loop) The largest number is: $basicForMax');

  // 2. For-in loop iteration
  int forInMax = numbers.first;
  for (final number in numbers) {
    if (number > forInMax) {
      forInMax = number;
    }
  }
  print('2. (For-in iteration) The largest number is: $forInMax');

  // 3. ForEach method with arrow function
  int forEachMax = numbers.first;
  numbers.forEach((n) => forEachMax = n > forEachMax ? n : forEachMax);
  print('3. (ForEach method) The largest number is: $forEachMax');

  // 4. Reduce with math.max
  final reduceMax = numbers.reduce(max);
  print('4. (Reduce with math.max) The largest number is: $reduceMax');

  // 5. Fold with initial value
  final foldMax = numbers.fold(numbers.first, (a, b) => a > b ? a : b);
  print('5. (Fold method) The largest number is: $foldMax');

  // 6. Sort and last element
  final sorted = List<int>.from(numbers)..sort();
  print('6. (Sorting method) The largest number is: ${sorted.last}');

  // 7. Spread operator with list creation
  print('7. (Spread operator) The largest number is: ${(List<int>.of(numbers)..sort()).last}');

  // 8. Using Iterable's reduce
  print('8. (Iterable reduce) The largest number is: ${numbers.reduce((a, b) => a > b ? a : b)}');

  // 9. While loop implementation
  int whileMax = numbers.first;
  int counter = 0;
  while (counter < numbers.length) {
    if (numbers[counter] > whileMax) {
      whileMax = numbers[counter];
    }
    counter++;
  }
  print('9. (While loop) The largest number is: $whileMax');

  // 10. Recursive approach
  int findMaxRecursive(List<int> list, int currentMax) {
    if (list.isEmpty) return currentMax;
    return findMaxRecursive(
        list.sublist(1), list.first > currentMax ? list.first : currentMax);
  }
  print('10. (Recursive method) The largest number is: ${findMaxRecursive(numbers, numbers.first)}');

  // 11. Extension method (declared outside main)
  print('11. (Extension method) The largest number is: ${numbers.maximum}');
}

/// Custom extension for maximum value
extension MaxFinder on List<int> {
  int get maximum => reduce((a, b) => a > b ? a : b);
}