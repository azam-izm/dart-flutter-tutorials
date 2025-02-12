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
