/*
======================
DART PATTERN PRINTING 
======================
This program demonstrates various pyramid and pattern printing algorithms.
Each section shows a different pattern type with implementation details.
Used nested loops, string manipulation, and pattern logic.
============================================
*/

void main() {
/*
============================================
Right-Half Pyramid
============================================
Row Details (Top to Bottom):
*           <-- Row 1: 1 star
* *         <-- Row 2: 2 stars
* * *       <-- Row 3: 3 stars
* * * *     <-- Row 4: 4 stars
* * * * *   <-- Row 5: 5 stars

Pattern Description:
- Right-aligned triangular pattern
- Each row contains stars equal to row number
- Simple incremental progression (1 → 5 stars)
- No spaces required between stars
============================================
*/
  {
    print('Right-Half Pyramid');
    for (int i = 1; i <= 5; i++) { // Outer loop controls the number of rows (5 rows)
      String star = '';
      for (int j = 1; j <= i; j++) { // Inner loop adds stars equal to current row number

        star += '* ';
      }
      print(star);
    }
  }

/*
============================================
Left-Half Pyramid
============================================
Row Details (Top to Bottom):
        *     <-- Row 1: 8 spaces | 1 star
      * *     <-- Row 2: 6 spaces | 2 stars
    * * *     <-- Row 3: 4 spaces | 3 stars
  * * * *     <-- Row 4: 2 spaces | 4 stars
* * * * *     <-- Row 5: 0 spaces | 5 stars

Pattern Description:
- Right-aligned triangular pattern
- Each row contains:
  1. Decreasing leading spaces (8 → 0)
  2. Increasing stars (1 → 5)
- Space reduction: 2 spaces less per row
- Star increment: 1 additional star per row
============================================
*/
  {
    print('\nLeft-Half Pyramid');
    for (int i = 1; i <= 5; i++) {
      String star = '';
      // Add leading spaces
      for (int j = 5; j > i; j--) { // Add decreasing number of leading spaces (2 per missing star)
        star += '  '; // Two spaces maintain proper alignment
      }
      for (int k = 1; k <= i; k++) {
        star += '* '; // Add stars equal to row number
      }
      print(star);
    }
  }

/*
============================================
Full Pyramid
============================================
Row Details (Top to Bottom):
    *         <-- 4 spaces | 1 star
   * *        <-- 3 spaces | 2 stars
  * * *       <-- 2 spaces | 3 stars
 * * * *      <-- 1 space  | 4 stars
* * * * *     <-- 0 spaces | 5 stars

Pattern Description:
- Perfectly centered star pyramid
- Each row contains:
  1. Decreasing leading spaces (4 → 0)
  2. Increasing stars (1 → 5)
- Star spacing: Single space between stars
- Symmetrical shape with triangular formation
============================================
*/
  print('\nFull Pyramid');
  {
    for (int i = 1; i <= 5; i++) {
      String star = '';
      for (int j = 4; j >= i; j--) { // Spaces decrease as we go down the rows (4 -> 0)
        star += " "; // Single space per position
      }
      for (int k = 1; k <= i; k++) {
        star += '* '; // Star + space creates pyramid effect
      }
      print(star);
    }
  }

/*
============================================
Inverted Right-Half Pyramid
============================================
Row Details (Top to Bottom):
* * * * *    <-- 5 stars
* * * *      <-- 4 stars
* * *        <-- 3 stars
* *          <-- 2 stars
*            <-- 1 star

Pattern Description:
- Right-aligned downward triangular pattern
- Simple star reduction: 5 → 1 stars
- Each row contains 1 less star than previous
- No spaces required between stars
============================================
*/
  {
    print('\nInverted Right-Half Pyramid');
    for (int i = 1; i <= 5; i++) {
      String star = '';
      for (int j = 5; j >= i; j--) {
        star += '* ';
      }
      print(star);
    }
  }

/*
============================================
Inverted Left-Half Pyramid
============================================
Row Details (Top to Bottom):
* * * * *    <-- 0 spaces | 5 stars
  * * * *    <-- 2 spaces | 4 stars
    * * *    <-- 4 spaces | 3 stars
      * *    <-- 6 spaces | 2 stars
        *    <-- 8 spaces | 1 star

Pattern Description:
- Right-aligned downward triangular pattern
- Each row contains:
  1. Increasing leading spaces (+2 per row)
  2. Decreasing stars (-1 per row)
- Space-star relationship:
  Row 1: 0 spaces + 5 stars
  Row 5: 8 spaces + 1 star
============================================
*/
  {
    print('\nInverted Left-Half Pyramid');
    for (int i = 1; i <= 5; i++) {
      String star = '';
      for (int j = 2; j <= i; j++) {
        star += "  ";
      }
      for (int k = 5; k >= i; k--) {
        star += '* '; // 2 spaces per position
      }
      print(star);
    }
  }

/*
============================================
Inverted Full Pyramid
============================================
Row Details (Top to Bottom):
* * * * *    <-- 0 spaces | 5 stars
 * * * *     <-- 1 space  | 4 stars
  * * *      <-- 2 spaces | 3 stars
   * *       <-- 3 spaces | 2 stars
    *        <-- 4 spaces | 1 star

Pattern Description:
- Centered downward star pattern
- Each row contains:
  1. Increasing left spaces (0 → 4)
  2. Decreasing stars (5 → 1)
- Maintains pyramid shape through star spacing
- Symmetrical reduction from base to tip
============================================
*/
  {
    print('\nInverted Full Pyramid');
    for (int i = 1; i <= 5; i++) {
      String star = '';
      for (int j = 2; j <= i; j++) {
        star += ' ';
      }
      for (int k = 5; k >= i; k--) {
        star += '* '; // Star + space maintains shape
      }
      print(star);
    }
  }
/*
============================================
Rhombus Pattern
============================================
Row Details (Top to Bottom):
* * * *      <-- 0 spaces | 4 stars
 * * * *     <-- 1 space  | 4 stars
  * * * *    <-- 2 spaces | 4 stars
   * * * *   <-- 3 spaces | 4 stars
    * * * *  <-- 4 spaces | 4 stars

Pattern Description:
- Right-leaning parallelogram shape
- All rows contain 4 stars with spacing
- Progressive left indentation (0 → 4 spaces)
- Each new row adds 1 leading space
- Maintains consistent star count per row
============================================
*/
  {
    print('\nRhombus Pattern');
    for (int i = 1; i <= 5; i++) {
      String star = '';
      for (int j = 2; j <= i; j++) {
        star += ' '; // Single space per position
      }
      for (int k = 1; k <= 4; k++) {
        star += '* ';
      }
      print(star);
    }
  }

/*
============================================
Diamond Pattern
============================================
Row Details (Top to Bottom):
   *           <-- Row 1: 3 spaces | 1 star
  * *          <-- Row 2: 2 spaces | 2 stars
 * * *         <-- Row 3: 1 space  | 3 stars
* * * *        <-- Row 4: 0 spaces | 4 stars (middle)
 * * *         <-- Row 5: 1 space  | 3 stars
  * *          <-- Row 6: 2 spaces | 2 stars
   *           <-- Row 7: 3 spaces | 1 star

Pattern Description:
- Symmetrical diamond shape with 7 rows
- Combines:
  1. Upper pyramid (4 rows): Decreasing spaces (3→0) + Increasing stars (1→4)
  2. Lower pyramid (3 rows): Increasing spaces (1→3) + Decreasing stars (3→1)
- Mirror pattern around middle row (4 stars)
============================================
*/
  {
    print('\nDiamond Pattern');
    for (int i = 1; i <= 4; i++) {
      String star = '';
      for (int j = 3; j >= i; j--) {
        star += ' ';
      }

      for (int k = 1; k <= i; k++) {
        star += '* ';
      }
      print(star);
    }

    for (int i = 1; i <= 3; i++) {
      String star = '';
      for (int j = 1; j <= i; j++) {
        star += ' ';
      }
      for (int k = 3; k >= i; k--) {
        star += '* ';
      }
      print(star);
    }
  }

/*
============================================
Hourglass Pattern
============================================
Row Details (Top to Bottom):
* * * *        <-- 4 stars | 0 spaces
 * * *         <-- 3 stars | 1 space
  * *          <-- 2 stars | 2 spaces
   *           <-- 1 star  | 3 spaces
  * *          <-- 2 stars | 2 spaces
 * * *         <-- 3 stars | 1 space
* * * *        <-- 4 stars | 0 spaces

Pattern Description:
- Mirror pattern with 7 total rows
- Top half: Decreasing stars (4→1) + Increasing spaces (0→3)
- Bottom half: Increasing stars (2→4) + Decreasing spaces (2→0)
- Narrowest point: 1 star at middle (4th row)
============================================
*/
  {
    print('\nHourglass Pattern');
    for (int i = 1; i <= 4; i++) {
      String star = '';
      for (int j = 2; j <= i; j++) {
        star += ' ';
      }
      for (int j = 4; j >= i; j--) {
        star += '* ';
      }
      print(star);
    }
    for (int i = 1; i <= 3; i++) {
      String star = '';
      for (int j = 2; j >= i; j--) {
        star += ' ';
      }
      for (int k = 0; k <= i; k++) {
        star += '* ';
      }
      print(star);
    }
  }

/*
============================================
Hollow Square Pattern
============================================
Row Details:
* * * * *    <-- Stars at odd columns (1,3,5,7,9)
*       *    <-- Stars only at first & last column
*       *    <-- Stars only at first & last column
*       *    <-- Stars only at first & last column
* * * * *    <-- Stars at odd columns (1,3,5,7,9)

Pattern Description:
- 5x9 rectangular pattern with hollow center
- Border elements:
  1. Top/Bottom: Stars at odd columns (spaced pattern)
  2. Sides: Stars at first & last columns
- Inner area: Empty spaces
- Combines spaced borders with vertical edge lines
============================================
*/
  {
    print('\nHollow Square Pattern');
    for (int i = 1; i <= 5; i++) {
      String star = '';
      for (int j = 1; j <= 9; j++) {
        if (i == 1 && j.isOdd || // Top row odd columns
        j == 1 || // Left edge
        j == 9 || // Right edge
        i == 5 && j.isOdd) { // Bottom row odd columns
          star += '*';
        } else {
          star += ' ';  // Inner area spaces
        }
      }
      print(star);
    }
  }

/*
============================================
Hollow Full Pyramid
============================================
Row Details (Top to Bottom):
    *         <-- Row 1: 1 star at center
   * *        <-- Row 2: 2 stars (edges)
  *   *       <-- Row 3: 2 stars (edges)
 *     *      <-- Row 4: 2 stars (edges)
* * * * *     <-- Row 5: 5 stars (full base)

Pattern Description:
- Pyramid outline with hollow interior
- Star placement rules:
  1. Left edge: Positions where (row + column = 6)
  2. Right edge: Positions where (column - row = 4)
  3. Base row (5th): All odd columns
- Total width: 9 columns for proper centering
- Pure border pattern with empty inner space
============================================
*/
  {
    print('\nHollow Full Pyramid');
    for (int i = 1; i <= 5; i++) {
      String star = '';
      for (int j = 1; j <= 9; j++) {
        if (i + j == 6 || // Left diagonal
            j - i == 4 || // Right diagonal
            i == 5 && j.isOdd) { // Base row (every other position)
          star += '*';
        } else {
          star += ' ';
        }
      }
      print(star);
    }
  }

/*
============================================
Hollow Inverted Full Pyramid
============================================
Row Details (Top to Bottom):
* * * * *    <-- Row 1: 5 stars (odd columns)
 *     *     <-- Row 2: 2 stars (positions 2 & 8)
  *   *      <-- Row 3: 2 stars (positions 3 & 7)
   * *       <-- Row 4: 2 stars (positions 4 & 6)
    *        <-- Row 5: 1 star  (position 5)

Pattern Description:
- Inverted pyramid outline with hollow interior
- Star placement rules:
  1. Top row: All odd columns (full star line)
  2. Left edge: Positions where (row = column)
  3. Right edge: Positions where (row + column = 10)
  4. Bottom tip: Center position (column 5)
- Total width: 9 columns for proper centering
============================================
*/
  {
    print('\nHollow Inverted Full Pyramid');
    for (int i = 1; i <= 5; i++) {
      String star = '';
      for (int j = 1; j <= 9; j++) {
        if (i == 1 && j.isOdd || // Top full row (odd columns)
        i == j || // Left diagonal edge
        i + j == 10) { // Right diagonal edge
          star += '*';
        } else {
          star += ' '; // Hollow interior
        }
      }
      print(star);
    }
  }

/*
============================================
Hollow Diamond Pattern
============================================
Row Details (Top to Bottom):
   *         <-- Row 1: 1 star (center)
  * *        <-- Row 2: 2 stars (positions 3 & 5)
 *   *       <-- Row 3: 2 stars (positions 2 & 6)
*     *      <-- Row 4: 2 stars (positions 1 & 7)
 *   *       <-- Row 5: 2 stars (positions 2 & 6)
  * *        <-- Row 6: 2 stars (positions 3 & 5)
   *         <-- Row 7: 1 star (position 4)

Pattern Description:
- 7x7 hollow diamond with mirrored top/bottom halves
- Star placement rules:
  1. Upper half (Rows 1-3): Left/Right diagonal edges
  2. Middle row (Row 4): Leftmost & rightmost stars
  3. Lower half (Rows 5-7): Mirrored upper half pattern
  4. Special edge cases for perfect symmetry
- Pure border pattern with empty inner space
============================================
*/
  {
    print('\nHollow Diamond Pyramid');
    for (int i = 1; i <= 7; i++) {
      String star = '';
      for (int j = 1; j <= 7; j++) {
        if (i + j == 5 || // Upper left diagonal
            j - i == 3 || // Upper right diagonal
            i - j == 3 || // Lower left diagonal
            i == 5 && j == 6 || // Lower right special case 1
            i == 6 && j == 5) { // Lower right special case 2
          star += '*';
        } else {
          star += ' ';
        }
      }
      print(star);
    }
  }

/*
============================================
Hollow Hourglass Pattern
============================================
Row Details (Top to Bottom):
* * * *      <-- Row 1: Stars at 1,3,5,7
 *   *       <-- Row 2: Stars at 2 & 6
  * *        <-- Row 3: Stars at 3 & 5
   *         <-- Row 4: Star at 4 (center)
  * *        <-- Row 5: Stars at 3 & 5
 *   *       <-- Row 6: Stars at 2 & 6
* * * *      <-- Row 7: Stars at 1,3,5,7

Pattern Description:
- 7x7 symmetric hourglass with hollow center
- Star placement rules:
  1. Top/Bottom: Stars at odd columns (full border)
  2. Left diagonal: Positions where (row = column)
  3. Right diagonal: Positions where (row + column = 8)
  4. Middle row: Single center star
- Combines spaced borders with diagonal edges
============================================
*/
  {
    print('\nHollow Hourglass Pattern');
    for (int i = 1; i <= 7; i++) {
      String star = '';
      for (int j = 1; j <= 7; j++) {
        if (i == 1 && j.isOdd || // Top border
        i == 7 && j.isOdd || // Bottom border
        i == j || // Left diagonal
        i + j == 8) { // Right diagonal
          star += '*';
        } else {
          star += ' '; // Hollow interior
        }
      }

      print(star);
    }
  }

/*
============================================
Floyd's Triangle
============================================
Row Details (Top to Bottom):
1           <-- Row 1: 1 number
2 3         <-- Row 2: 2 numbers
4 5 6       <-- Row 3: 3 numbers
7 8 9 10    <-- Row 4: 4 numbers

Pattern Description:
- Right-angled triangle with consecutive numbers
- Each row contains numbers equal to row number
- Natural number progression (1, 2, 3, 4...)
- Last number in row 4: 10 (sum of 1+2+3+4=10)
============================================
*/
  {
    print('\nFloyd\'s Triangle');
    int count = 1;
    for (int i = 1; i <= 4; i++) {
      String row = '';
      for (int j = 1; j <= i; j++) {
        row += '$count ';
        count++;
      }
      print(row);
    }
  }

/*
============================================
Pascal's Triangle
============================================
Row Details (n=0 to 3):
    1           <-- n=0: C(0,0)
   1 1          <-- n=1: C(1,0) C(1,1)
  1 2 1         <-- n=2: C(2,0) C(2,1) C(2,2)
 1 3 3 1        <-- n=3: C(3,0) C(3,1) C(3,2) C(3,3)

Pattern Description:
- Triangular array of binomial coefficients
- Each number = sum of two numbers above it
- Uses combination formula: C(n,k) = n!/(k!(n-k)!)
- Key Features:
  1. Recursive factorial calculation
  2. Centered row alignment
  3. 0-based indexing for rows/positions
============================================
*/

  {
    print('\nPascal\'s Triangle');

    /* 
  Function to calculate the factorial of a number `n`.
  Factorial of a number n (denoted as n!) is the product of all positive integers <= n.
  Example: 5! = 5 * 4 * 3 * 2 * 1 = 120
  */
    int factorial(int n) {
      if (n == 0 || n == 1) return 1; // Base case: 0! and 1! are both 1
      return n * factorial(n - 1); // Recursive case: n! = n * (n-1)!
    }

    int binomialCoefficient(int n, int k) {
      return factorial(n) ~/
          (factorial(k) * factorial(n - k)); // Using integer division (~/)
    }

    int rows = 4; // Number of rows to generate in Pascal's Triangle

    for (int i = 0; i < rows; i++) {
      String row = ''; // Initialize an empty string to store the current row

      for (int j = 0; j <= i; j++) {
        row +=
            '${binomialCoefficient(i, j)} '; // Append the binomial coefficient to the row
      }

      print(' ' * (rows - i - 1) + row.trim());
    }
  }
}
