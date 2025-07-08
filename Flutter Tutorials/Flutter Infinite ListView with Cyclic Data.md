/*
========================================
Flutter Infinite ListView with Cyclic Data
========================================

PURPOSE
-------
This app demonstrates how to create a ListView in Flutter that
infinitely loops over a finite list of names and background colors
using the modulo operator `%`.

The modulo logic ensures that as the index increases, it wraps around
to the beginning of the list, creating a seamless repeating pattern
without index out-of-range errors.

Author: Muhammad Azam
========================================
*/

import 'package:flutter/material.dart';

void main() {
  runApp(const InfiniteListApp());
}

// Root of the app
class InfiniteListApp extends StatelessWidget {
  const InfiniteListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: InfiniteListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// A screen showing an infinitely scrolling ListView
class InfiniteListScreen extends StatelessWidget {
  const InfiniteListScreen({super.key});

  // List of names to display in each list item
  final List<String> names = const [
    'Text1',
    'Text2',
    'Text3',
    'Text4',
    'Text5'
  ];

  // List of background colors to cycle through
  final List<Color> backgroundColors = const [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.grey,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infinite Scrolling List'),
      ),
      body: ListView.builder(
        // No itemCount defined -> infinite scrolling
        itemBuilder: (context, index) {
          final color = backgroundColors[index % backgroundColors.length];
          final name = names[index % names.length];

          return Container(
            height: 140,
            color: color,
            child: Center(
              child: Text(
                name,
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}

/*
==============================
🤖 Dry Run: index % list.length
==============================

Let’s say:
- names.length = 5
- backgroundColors.length = 5

The index will cycle as follows:

index   index % 5   names[index % 5]   Output

0       0           names[0]           Text1
1       1           names[1]           Text2
2       2           names[2]           Text3
3       3           names[3]           Text4
4       4           names[4]           Text5
5       0           names[0]           Text1 🔁
6       1           names[1]           Text2 🔁
7       2           names[2]           Text3 🔁
8       3           names[3]           Text4 🔁
9       4           names[4]           Text5 🔁
...     ...         ...                (loops...)
*/
