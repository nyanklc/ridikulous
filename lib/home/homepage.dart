import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("homepage"),
      ),
      body: const Center(
        child: Column(
          children: [
            Text("1"),
            Text("2"),
            Text("3"),
            Text("4"),
            Text("5"),
          ],
        ),
      ),
    );
  }
}