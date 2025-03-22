**Q: What is the purpose of the abs() method in Dart, and how is it used?**

The purpose of abs() is to return the positive equivalent of a number, regardless of whether the original number is positive or negative. This method is available for both int and double types in Dart.
```
void main() {
  int negativeNumber = -5;
  int positiveNumber = 10;
  
  // Get the absolute value
  print(negativeNumber.abs()); // Output: 5
  print(positiveNumber.abs()); // Output: 10
}
```
**===== Dart Questions & Answers =====**

**Q: How can we reverse a string in Dart?**

In Dart, we can reverse a string using ```stringName.split('').reversed.join();```
```
String reverseString(String str) {
  return str.split('').reversed.join();
}

void main() {
  String original = "hello";
  print('Original: $original'); //Original: hello
  print('Reversed: ${reverseString(original)}'); //Reversed: olleh
}
```
How can we reverse an integer in Dart? ```int.parse(stringName.toString().split('').reversed.join());```
```
int reverseInteger(int num) {
  return int.parse(num.toString().split('').reversed.join());
}

void main() {
  int original = 12345;
  print('Original: $original'); // Original: 12345
  print('Reversed: ${reverseInteger(original)}'); // Reversed: 54321
}
```
How to Reverse an Integer in Dart and Handle Negative Numbers? ```int.parse(stringName.abs().toString().split('').reversed.join());```
```
int reverseInteger(int num) {
  bool isNegative = num < 0; // Check if number is negative
  int reversed = int.parse(num.abs().toString().split('').reversed.join());
  return isNegative
      ? -reversed
      : reversed; // Reapply the negative sign if needed
}

void main() {
  int original = -12345;
  print('Original: $original'); // Original: -12345
  print('Reversed: ${reverseInteger(original)}'); // Reversed: -54321
}
```
This splits the string into a list of characters, reverses the list, and joins it back into a string.

**===== Dart Questions & Answers =====**

**Q: What is the purpose of the copyWith method in Dart/Flutter?**

It creates a new object with modified properties while keeping other values unchanged, ensuring immutability.

```
class User {
  final String name;
  final int age;

  User({required this.name, required this.age});

  User copyWith({String? name, int? age}) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }
}

void main() {
  var user1 = User(name: "Ali", age: 25);
  var user2 = user1.copyWith(age: 26); // Creates a new object with updated age

  print(user2.name); // Ali
  print(user2.age);  // 26
}
```

**===== Dart Questions & Answers =====**

**Q: What is the purpose of using model classes in Dart?**

Model classes are used in Dart to represent data in a structured and type-safe way, making the code more readable, maintainable, and error-free.

**===== Dart Questions & Answers =====**

**Q: What is shadowing in Dart?**

Shadowing is when a variable declared in an inner scope has the same name as one in an outer scope, causing the inner one to hide the outer.

**===== Dart Questions & Answers =====**

**Q: Why do we create custom constructors?**

To define specific initialization logic and control object creation.

**===== Dart Questions & Answers =====**

**Q: Do for, for-in, and forEach return anything in Dart?**

❌ No, all three return void and do not produce a value.

**===== Dart Questions & Answers =====**

**Q: Is forEach a method or a statement?**

forEach is a method that belongs to the Iterable class and is used to iterate over elements.
 
**===== Dart Questions & Answers =====**

**Q: Are for and for-in methods?**

No, for and for-in are control flow statements and not methods, as they are built into Dart's syntax.

**===== Dart Questions & Answers =====**

**Q: How to recognize a function in Dart?**

A function has a return type, a name (unless anonymous), parentheses () for parameters, and a body {} or => for expressions.

**===== Dart Questions & Answers =====**

**Q: Does everything with parentheses () mean it's a function?**

 No, parentheses can also be used in method calls, constructor calls, and function variables, so not everything with () is a function.
 
 **===== Dart Questions & Answers =====**
 
**Q: What’s the key difference between for, for-in, and forEach?**

The for loop is a general-purpose control flow statement that allows full control over iteration, including using break and continue. The for-in loop is a simpler way to iterate over collections but still supports break and continue. The forEach method, on the other hand, is a built-in method of Iterable, requires an object to be called on, and does not support break or continue, making it less flexible than the other two loops.

**===== Dart Questions & Answers =====**


**Q: What are the different types of variables?**  

Variable types can be categorized into five main parts based on different characteristics:

1. **Based on Scope (Where the Variable is Declared):**  
   - **Top-level variables:** Declared outside classes/functions, at the library level.  
   - **Class-level variables (Fields):** Declared within a class (either instance or static).
   - **Local variables:** Declared inside a function, method, or code blocks (e.g., loop variables).
   - **Parameter variables:** Function/method parameters (their scope is limited to the function body).  

2. **Based on Access Control (Encapsulation):**  
   - **Public variables:** Accessible from other libraries (no _ prefix, e.g., int age;).
   - **Private variables:** Prefixed with _ (e.g., int _age;). These are library-private, not class-private.

3. **Based on Memory Allocation (Instance vs. Class Variables):**  
   - **Instance variables:** Belong to an object instance (e.g., class Person { int age; } – age is instance-level).
   - **Static variables:** Belong to the class itself (static keyword, e.g., static int count;).  

4. **Based on Mutability (Changeability of Values):**  
   - **Mutable variables:** Can be reassigned (default).  
   - **Immutable variables:**  
   • **final**: Set once (runtime constant).  
   • **const**: Compile-time constant.


5. **Based on Initialization and Nullability**
   - **Nullable variables:** Can hold null (e.g., int? age;).
   - **Non-nullable variables:** Must always hold a value (Dart's default with null safety).
   - **late variables:** Non-nullable variables initialized after declaration (e.g., late String name;).

Each of these categories defines how a variable behaves in terms of scope, accessibility, storage, mutability, initialization behavior and nullability.
   
**===== Dart Questions & Answers =====** 


**Q: What is the difference between .reduce and .fold in Dart?**

**.reduce:** Combines all elements of a non-empty collection into a single value using a function. Throws an error if the collection is empty.
Example: listName.reduce((a, b) => a + b) → calculates the sum.

**.fold:** Similar to .reduce, but allows you to provide an initial value and works on empty collections.
Example: listName.fold(0, (a, b) => a + b) → calculates the sum with a starting value of 0.

**===== Dart Questions & Answers =====** 

**Q: Why does .reduce not work with an empty list but .fold works perfectly?**

**.reduce:** Requires at least one element in the list to start the reduction process. If the list is empty, it throws a runtime error (Bad state: No element) because there’s nothing to reduce.
Example: emptyList.reduce((a, b) => a + b) → Throws an error for an empty list.

**.fold:** Works with empty lists because it allows you to provide an initial value. If the list is empty, it simply returns the initial value without any errors.
Example: emptyList.fold(0, (a, b) => a + b) → Returns 0 for an empty list.

**===== Dart Questions & Answers =====** 

**Q: What is the difference between .where and .reduce in Dart?**

**.where:** Filters elements in a collection based on a condition and returns a new iterable.
Example: listName.where((n) => n % 2 == 0) → filters even numbers.

**.reduce:** Combines all elements into a single value (e.g., sum, product).
Example: listName.reduce((a, b) => a + b) → calculates the sum.

**===== Dart Questions & Answers =====** 

**Q: What is the difference between the .map() and .where() methods in Dart?**

**.map():** Transforms every element into a new value.

**.where():** Filters elements based on a condition.

**===== Dart Questions & Answers =====** 

**Q: How does Dart handle string repetition using the * operator, and why does it work only when the string is on the left?**

In Dart, a string can be repeated using the * operator when the left operand is a string and the right operand is an integer. This means that the string will be repeated n times, where n is the integer value. **void main() {for (int i = 1; i <= 6; i++) print('$i' * i);}**

**===== Dart Questions & Answers =====** 

