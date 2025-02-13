/**
 * Pattern Generation Methods in Dart

 * This program demonstrates eight distinct approaches to generate and print an incremental pattern of '&' characters.

 * Methods included:
 * - Basic for-loop with concatenation
 * - String multiplication
 * - While-loop
 * - List joining
 * - Recursive approach
 * - StringBuffer optimization
 * - Do-while loop
 * - Iterable.generate functional style
 */


void main() {
  // Method 1: Basic for-loop with string concatenation
  {
    print("Method 1: Basic for-loop");
    String andSymbol  = '&';
    for (int i = 1; i <= 5; i++) {
      print(andSymbol );
      andSymbol  += '&'; // Append one '&' per iteration
    }
  }

  // Method 2: Using string multiplication
  {
    print("\nMethod 2: String multiplication");
    for (int i = 1; i <= 5; i++) {
      print('&' * i); // Create string with i repetitions
    }
  }

  // Method 3: While-loop implementation
  {
    print("\nMethod 3: While-loop");
    String andSymbol  = '&';
    int counter = 1;
    while (counter <= 5) { 
      print(andSymbol );
      andSymbol  += '&';
      counter++;
    }
  }

  // Method 4: Using List and join
  {
    print("\nMethod 4: List joining");
    List<String> andSymbol  = [];
    for (int i = 1; i <= 5; i++) {
      andSymbol.add('&'); // Add one element per iteration
      print(andSymbol.join()); // Join list elements into string
    }
  }

  // Method 5: Recursive approach
  {
    print("\nMethod 5: Recursion");
    void buildLine(int andSymbol ) {
      if (andSymbol  > 5) return; // Base case
      print('&' * andSymbol );
      buildLine(andSymbol  + 1); // Recursive call
    }
    buildLine(1);
  }

  // Method 6: Using StringBuffer
  {
    print("\nMethod 6: StringBuffer");
    StringBuffer andSymbol  = StringBuffer();
    for (int i = 1; i <= 5; i++) {
      andSymbol.write('&'); // Efficient string building
      print(andSymbol.toString());
    }
  }

  // Method 7: Do-while loop
  {
    print("\nMethod 7: Do-while");
    String andSymbol  = '&';
    int counter = 1;
    do { // Execute at least once, check condition after
      print(andSymbol );
      andSymbol  += '&';
      counter++;
    } while (counter <= 5);
  }

  // Method 8: Using Iterable.generate
  {
    print("\nMethod 8: Iterable.generate");
    Iterable.generate(5, (index) => index + 1)
      .forEach((n) => print('&' * n));
  }
}