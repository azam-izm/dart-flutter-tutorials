/*
Flutter ListView with Item Selection
Purpose: Demonstrate how to use ListView.separated to display a list of items
         where tapping on an item toggles a 'favorite' state.
*/

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListScreen(),
    );
  }
}

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final List<int> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Selectable List Example'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 50,
        itemBuilder: (context, index) {
          final isSelected = selectedItems.contains(index);
          return ListTile(
            onTap: () {
              setState(() {
                if (isSelected) {
                  selectedItems.remove(index);
                } else {
                  selectedItems.add(index);
                }
              });
            },
            title: Text('Item ${index + 1}'),
            trailing: Icon(
              isSelected ? Icons.favorite : Icons.favorite_outline,
              color: isSelected ? Colors.red : null,
            ),
          );
        },
      ),
    );
  }
}
