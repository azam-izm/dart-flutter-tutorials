import 'dart:math';

void main() {
  List<int> numbers = [5, 10, 4, 1, 13];

  // 1️⃣ Finding the Largest and Smallest Number
  int largest = numbers[0], smallest = numbers[0];

  for (int num in numbers) {
    if (num > largest) largest = num;
    if (num < smallest) smallest = num;
  }

  print('Largest: $largest');
  print('Smallest: $smallest');

  // Using reduce() method
  int largestReduce = numbers.reduce((a, b) => a > b ? a : b);
  int smallestReduce = numbers.reduce((a, b) => a < b ? a : b);
  print('Largest (reduce): $largestReduce');
  print('Smallest (reduce): $smallestReduce');

  // Using max() and min() from dart:math
  print('Largest (math): ${numbers.reduce(max)}');
  print('Smallest (math): ${numbers.reduce(min)}');

  // 2️⃣ Finding the 2nd Largest and 2nd Smallest Number
  int secondLargest = numbers[0], secondSmallest = numbers[0];

  for (int num in numbers) {
    if (num > secondLargest && num != largest) secondLargest = num;
    if (num < secondSmallest && num != smallest) secondSmallest = num;
  }

  print('2nd Largest: $secondLargest');
  print('2nd Smallest: $secondSmallest');

  // Using sorting
  List<int> sortedNumbers = List.from(numbers)..sort();
  print('2nd Largest (sorted): ${sortedNumbers[sortedNumbers.length - 2]}');
  print('2nd Smallest (sorted): ${sortedNumbers[1]}');

  // 3️⃣ Finding the 3rd Largest and 3rd Smallest Number
  int thirdLargest = numbers[0], thirdSmallest = numbers[0];

  for (int num in numbers) {
    if (num > thirdLargest && num != largest && num != secondLargest) thirdLargest = num;
    if (num < thirdSmallest && num != smallest && num != secondSmallest) thirdSmallest = num;
  }

  print('3rd Largest: $thirdLargest');
  print('3rd Smallest: $thirdSmallest');

  // Using sorting
  print('3rd Largest (sorted): ${sortedNumbers[sortedNumbers.length - 3]}');
  print('3rd Smallest (sorted): ${sortedNumbers[2]}');
}

/*
==========================================
    📌 Final Thoughts: Best Approaches
==========================================
✅ If sorting is allowed → Use sorting (Easiest)
✅ If sorting is NOT allowed → Use loops (Efficient O(n) time)

| Approach                     | Pros                              | Cons                          |
|------------------------------|----------------------------------|------------------------------|
| **Loop (Without Sorting)**   | Works without modifying list, Efficient O(n)  | More lines of code  |
| **Sorting + Indexing**       | Simple and easy                 | Modifies the list, O(n log n) |
| **Built-in Methods (reduce, max, min)** | Shortest code  | Works only for largest/smallest, not 2nd or 3rd |

⭐ **Best Practice Recommendation**:
- **Use sorting** when modifying the list is **allowed**.
- **Use loops** when sorting is **not an option** and performance matters.
*/
