/*
 * EXTREME VALUE ANALYZER: THREE LEVEL IMPLEMENTATION
 *
 * This program demonstrates four distinct methods to find:
 * - 3 Largest values (L1, L2, L3)
 * - 3 Smallest values (S1, S2, S3)
 * 
 * Methods Shown:
 * 1. Reduce Method: Uses Dart's reduce with value filtering
 * 2. Loop Method: Single-pass algorithm with clever value tracking
 * 3. Sorting Method: Classic approach using sorted list positions
 * 4. Removal Method: Sequential removal of previous extremes
 */

import 'dart:math';

void main() {
  final numbers = [-100, 20, -40, 30, 50, 30, 60, -70, 55];

  // ===== Reduce Method =====
  final largest = numbers.reduce(max);
  final smallest = numbers.reduce(min);
  //OR
  int largestNumber = numbers.reduce((a, b) => a > b ? a : b);
  print('(Reduce): Largest Number is $largestNumber'); //(Reduce): Largest Number is 60
  int smallestNumber = numbers.reduce((a, b) => a < b ? a : b);
  print('(Reduce): Smallest Number is $smallestNumber\n'); //(Reduce): Smallest Number is -100

  final secondLargest = numbers.where((n) => n < largest).reduce(max);
  final thirdLargest = numbers.where((n) => n < secondLargest).reduce(max);

  final secondSmallest = numbers.where((n) => n > smallest).reduce(min);
  final thirdSmallest = numbers.where((n) => n > secondSmallest).reduce(min);

  print('(Reduce) Largest: $largest, Second: $secondLargest, Third: $thirdLargest'); //(Reduce) Largest: 60, Second: 55, Third: 50
  print('(Reduce) Smallest: $smallest, Second: $secondSmallest, Third: $thirdSmallest\n'); //(Reduce) Smallest: -100, Second: -70, Third: -40

  // ===== Loop Method =====
  int loopLargest = numbers[0];
  int loopSecondLargest = numbers[1];
  int loopThirdLargest = numbers[2];
  int loopSmallest = numbers[3];
  int loopSecondSmallest = numbers[4];
  int loopThirdSmallest = numbers[5];

  for (final num in numbers) {
    // Update largest values
    if (num > loopLargest) {
      loopThirdLargest = loopSecondLargest;
      loopSecondLargest = loopLargest;
      loopLargest = num;
    } else if (num > loopSecondLargest && num != loopLargest) {
      loopThirdLargest = loopSecondLargest;
      loopSecondLargest = num;
    } else if (num > loopThirdLargest && num != loopSecondLargest && num != loopLargest) {
      loopThirdLargest = num;
    }

    // Update smallest values
    if (num < loopSmallest) {
      loopThirdSmallest = loopSecondSmallest;
      loopSecondSmallest = loopSmallest;
      loopSmallest = num;
    } else if (num < loopSecondSmallest && num != loopSmallest) {
      loopThirdSmallest = loopSecondSmallest;
      loopSecondSmallest = num;
    } else if (num < loopThirdSmallest && num != loopSecondSmallest && num != loopSmallest) {
      loopThirdSmallest = num;
    }
  }
  print('(Loop) Largest: $loopLargest, Second: $loopSecondLargest, Third: $loopThirdLargest'); //(Loop) Largest: 60, Second: 55, Third: 50
  print('(Loop) Smallest: $loopSmallest, Second: $loopSecondSmallest, Third: $loopThirdSmallest\n'); //(Loop) Smallest: -100, Second: -70, Third: -40

  // ===== Sorting Method =====
  final sorted = List<int>.from(numbers)..sort();
  print('(Sorting) Largest: ${sorted.last}, Second: ${sorted[sorted.length - 2]}, Third: ${sorted[sorted.length - 3]}'); //(Sorting) Largest: 60, Second: 55, Third: 50
  print('(Sorting) Smallest: ${sorted.first}, Second: ${sorted[1]}, Third: ${sorted[2]}\n'); //(Sorting) Smallest: -100, Second: -70, Third: -40

  // ===== Removal Method =====
  var temp = List<int>.from(numbers);
  final removalLargest = temp.reduce(max);
  temp.remove(removalLargest);
  final removalSecondLargest = temp.reduce(max);
  temp.remove(removalSecondLargest);
  final removalThirdLargest = temp.reduce(max);

  temp = List<int>.from(numbers);
  final removalSmallest = temp.reduce(min);
  temp.remove(removalSmallest);
  final removalSecondSmallest = temp.reduce(min);
  temp.remove(removalSecondSmallest);
  final removalThirdSmallest = temp.reduce(min);

  print('(Removal) Largest: $removalLargest, Second: $removalSecondLargest, Third: $removalThirdLargest'); //(Removal) Largest: 60, Second: 55, Third: 50
  print('(Removal) Smallest: $removalSmallest, Second: $removalSecondSmallest, Third: $removalThirdSmallest'); //(Removal) Smallest: -100, Second: -70, Third: -40
}
