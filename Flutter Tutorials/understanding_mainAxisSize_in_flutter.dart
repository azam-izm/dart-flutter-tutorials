/*
========================================
  Flutter Lecture: Understanding MainAxisSize
========================================
📌 **Topic:** MainAxisSize in Row & Column  
📌 **Purpose:** To demonstrate the difference between `MainAxisSize.max` and `MainAxisSize.min`  
📌 **Key Takeaways:**
   - `MainAxisSize.max` → Expands to full available space.
   - `MainAxisSize.min` → Shrinks to fit only its children.
   - Works in both `Row` and `Column` but behaves differently based on constraints.
   - **Important:** If `MainAxisSize.min` is used inside a `Container` with a fixed height, it may still expand to fit the container.
========================================
*/

import 'package:flutter/material.dart';

void main() {
  runApp(const MainAxisSizeDemo());
}

class MainAxisSizeDemo extends StatelessWidget {
  const MainAxisSizeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:
            AppBar(title: const Text("MainAxisSize Demo"), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "🔹 Row with MainAxisSize.max (Takes full width)",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Container(
                color: Colors.redAccent,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                        color: Colors.amber,
                        padding: const EdgeInsets.all(8),
                        child: const Text("Hello")),
                    Container(
                        color: Colors.cyanAccent,
                        padding: const EdgeInsets.all(8),
                        child: const Text("World")),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "🔹 Row with MainAxisSize.min (Shrinks around children)",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Container(
                color: Colors.redAccent,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        color: Colors.amber,
                        padding: const EdgeInsets.all(8),
                        child: const Text("Hello")),
                    Container(
                        color: Colors.cyanAccent,
                        padding: const EdgeInsets.all(8),
                        child: const Text("World")),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "🔹 Column with MainAxisSize.max (Expands full height)",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Container(
                color: Colors.blueAccent,
                height: 200,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                        color: Colors.green,
                        padding: const EdgeInsets.all(8),
                        child: const Text("Item 1")),
                    Container(
                        color: Colors.orange,
                        padding: const EdgeInsets.all(8),
                        child: const Text("Item 2")),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "🔹 Column with MainAxisSize.min (Shrinks around children)",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Container(
                color: Colors.blueAccent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        color: Colors.green,
                        padding: const EdgeInsets.all(8),
                        child: const Text("Item 1")),
                    Container(
                        color: Colors.orange,
                        padding: const EdgeInsets.all(8),
                        child: const Text("Item 2")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
