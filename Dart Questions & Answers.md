Q1: What is the difference between .reduce and .fold in Dart?

ANS: .reduce: Combines all elements of a non-empty collection into a single value using a function. Throws an error if the collection is empty.
Example: listName.reduce((a, b) => a + b) → calculates the sum.

.fold: Similar to .reduce, but allows you to provide an initial value and works on empty collections.
Example: listName.fold(0, (a, b) => a + b) → calculates the sum with a starting value of 0.

===== Dart Questions & Answers =====

Q2: Why does .reduce not work with an empty list but .fold works perfectly?

ANS: .reduce: Requires at least one element in the list to start the reduction process. If the list is empty, it throws a runtime error (Bad state: No element) because there’s nothing to reduce.
Example: emptyList.reduce((a, b) => a + b) → Throws an error for an empty list.

.fold: Works with empty lists because it allows you to provide an initial value. If the list is empty, it simply returns the initial value without any errors.
Example: emptyList.fold(0, (a, b) => a + b) → Returns 0 for an empty list.

===== Dart Questions & Answers =====

Q3: What is the difference between .where and .reduce in Dart?

ANS: .where: Filters elements in a collection based on a condition and returns a new iterable.
Example: listName.where((n) => n % 2 == 0) → filters even numbers.

.reduce: Combines all elements into a single value (e.g., sum, product).
Example: listName.reduce((a, b) => a + b) → calculates the sum.

===== Dart Questions & Answers =====
