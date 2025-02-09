import 'dart:math';

void main() {
  List<int> numbers = [-100, 200, 40, 30, 50];  // Updated list of numbers

  // ================================================
  // 1️⃣ USING SORTING (Easiest approach)
  // ================================================
  List<int> sortedNumbers = List.from(numbers)..sort();
  print('Largest (sorted): ${sortedNumbers.last}');
  print('Smallest (sorted): ${sortedNumbers.first}');
  print('2nd Largest (sorted): ${sortedNumbers[sortedNumbers.length - 2]}');
  print('2nd Smallest (sorted): ${sortedNumbers[1]}');
  print('3rd Largest (sorted): ${sortedNumbers[sortedNumbers.length - 3]}');
  print('3rd Smallest (sorted): ${sortedNumbers[2]}');

  // ================================================
  // 2️⃣ Using Built-in Methods (reduce, max, min)
  // ================================================
  int largestReduce = numbers.reduce((a, b) => a > b ? a : b);
  int smallestReduce = numbers.reduce((a, b) => a < b ? a : b);
  print('Largest (reduce): $largestReduce');
  print('Smallest (reduce): $smallestReduce');
  print('Largest (math): ${numbers.reduce(max)}');
  print('Smallest (math): ${numbers.reduce(min)}');

  // ================================================
  // 3️⃣ Using Loops (No Sorting, More Complex)
  // ================================================
  int largest = numbers[0], smallest = numbers[0];
  int secondLargest = numbers[0], secondSmallest = numbers[0];
  int thirdLargest = numbers[0], thirdSmallest = numbers[0];

  // Loop to find Largest and Smallest
  for (int num in numbers) {
    if (num > largest) largest = num;
    if (num < smallest) smallest = num;
  }
  
  // Loop to find 2nd Largest and 2nd Smallest
  for (int num in numbers) {
    if (num > secondLargest && num != largest) secondLargest = num;
    if (num < secondSmallest && num != smallest) secondSmallest = num;
  }
  
  // Loop to find 3rd Largest and 3rd Smallest
  for (int num in numbers) {
    if (num > thirdLargest && num != largest && num != secondLargest) thirdLargest = num;
    if (num < thirdSmallest && num != smallest && num != secondSmallest) thirdSmallest = num;
  }

  print('Largest (loop): $largest');
  print('Smallest (loop): $smallest');
  print('2nd Largest (loop): $secondLargest');
  print('2nd Smallest (loop): $secondSmallest');
  print('3rd Largest (loop): $thirdLargest');
  print('3rd Smallest (loop): $thirdSmallest');
}

/*
==========================================
    📌 Final Thoughts: Best Approaches
==========================================
✅ If sorting is allowed → Use sorting (Easiest)
✅ If sorting is NOT allowed → Use loops (Efficient O(n) time)

| Approach                     | Pros                              | Cons                          |
|------------------------------|----------------------------------|------------------------------|
| **Sorting + Indexing**       | Simple and easy                 | Modifies the list, O(n log n) |
| **Built-in Methods (reduce, max, min)** | Shortest code  | Works only for largest/smallest, not 2nd or 3rd |
| **Loop (Without Sorting)**   | Works without modifying list, Efficient O(n) | More lines of code  |

⭐ **Best Practice Recommendation**:
- **Use sorting** when modifying the list is **allowed**.
- **Use loops** when sorting is **not an option** and performance matters.
*/
