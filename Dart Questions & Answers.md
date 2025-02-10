Q1: What is the difference between .reduce and .fold in Dart?

.reduce: Combines all elements of a non-empty collection into a single value using a function. Throws an error if the collection is empty.
Example: listName.reduce((a, b) => a + b) → calculates the sum.

.fold: Similar to .reduce, but allows you to provide an initial value and works on empty collections.
Example: listName.fold(0, (sum, n) => sum + n) → calculates the sum with a starting value of 0.

===== Dart Questions & Answers =====

Q2: What is the difference between .where and .reduce in Dart?

ANS: .where: Filters elements in a collection based on a condition and returns a new iterable.
Example: listName.where((n) => n % 2 == 0) → filters even numbers.

.reduce: Combines all elements into a single value (e.g., sum, product).
Example: listName.reduce((a, b) => a + b) → calculates the sum.

===== Dart Questions & Answers =====
