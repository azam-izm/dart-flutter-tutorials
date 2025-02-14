/*
 * Title: Convert Mixed Set to Integer Set
 * Description: This program takes a mixed-type Set containing integers, strings, and other data types. 
 *              It filters out only integer values and valid integer strings, then converts them into 
 *              a Set of integers.
 */

void main() {
  Set mixSet = {10, 12, '15', 'azam', true};

  Set<int> intSet = mixSet.where((element) {
    if (element is int) {
      return true; //If an element is an integer (`int`), return true (keep it).
    } else if (element is String) {
      return int.tryParse(element) !=
          null; // If an element is a string, check if it can be converted to an integer using `int.tryParse()`.
    } //If `int.tryParse()` is not null, it means the string is a valid integer, so keep it. Otherwise, discard the element.
    return false; // Ignore everything else
  }).map((element) {
    if (element is int) {
      return element; //If element is an integer, keep it the same.
    } else if (element is String) {
      return int.parse(element); // If element is a string, convert it to an integer using int.parse().
    }
    return 0; // This case never happens due to prior filtering in where()
  }).toSet();

  print(intSet); // Output: {10, 12, 15}
}

 /*
 * Summary: 
 * - `where` filters elements, keeping only integers and valid integer strings.
 * - `map` converts filtered elements into integers.
 * - The final result is a Set of integers, excluding non-convertible values.
 */
