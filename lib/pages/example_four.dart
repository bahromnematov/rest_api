import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleFour extends StatefulWidget {
  const ExampleFour({super.key});

  @override
  State<ExampleFour> createState() => _ExampleFourState();
}

class _ExampleFourState extends State<ExampleFour> {
  var data;

  Future<void> getUserApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rest Api"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                } else {
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context,index){
                      return Card(
                        child: Column(
                          children: [
                            ResursRow(value:"Name" ,title: data[index]['email'],),
                            ResursRow(value:"Name" ,title: data[index]['address']['street'],),
                            ResursRow(value:"Name" ,title: data[index]['address']['geo']['lat'],),
                            ResursRow(value:"Name" ,title: data[index]['company']['name'],),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class ResursRow extends StatelessWidget {
  String title, value;

  ResursRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(value),
          SizedBox(
            width: 10,
          ),
          Text(title)
        ],
      ),
    );
  }
}

