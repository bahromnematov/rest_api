import 'package:flutter/material.dart';

class ExampleFiver extends StatefulWidget {
  const ExampleFiver({super.key});

  @override
  State<ExampleFiver> createState() => _ExampleFiverState();
}

class _ExampleFiverState extends State<ExampleFiver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Course"),
      ),
    );
  }
}
