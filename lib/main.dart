import 'package:chat_gpt_api/chat_gpt.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rest_api/pages/example_four.dart';
import 'package:rest_api/pages/example_three.dart';
import 'package:rest_api/pages/example_two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExampleFour()
    );
  }
}
