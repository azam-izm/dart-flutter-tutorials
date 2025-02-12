**Q: What are the different types of variables?**  

Variable types can be categorized into five main parts based on different characteristics:

1. **Based on Scope (Where the Variable is Declared):**  
   - Top-level variables  
   - Class-level variables (Fields)  
   - Local variables  
   - Global variables  
   - Parameter variables  

2. **Based on Access Control (Encapsulation):**  
   - Public variables  
   - Private variables  

3. **Based on Memory Allocation (Instance vs. Class Variables):**  
   - Instance variables  
   - Static variables  

4. **Based on Mutability (Changeability of Values):**  
   - Mutable variables  
   - Immutable variables (`const` and `final`)

5. 

Each of these categories defines how a variable behaves in terms of scope, accessibility, storage, and mutability.
   
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
