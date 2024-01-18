import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class ExampleTree extends StatefulWidget {
  const ExampleTree({super.key});

  @override
  State<ExampleTree> createState() => _ExampleTreeState();
}

class _ExampleTreeState extends State<ExampleTree> {
  List<Users> userList = [];

  Future<List<Users>> getUsersApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (var i in data) {
        userList.add(Users.fromJson(i));
      }
      return userList;
    }
    return userList;
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
              future: getUsersApi(),
              builder: (context, AsyncSnapshot<List<Users>> snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                } else {
                  return ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            ResursRow(
                                value: "Name",
                                title: snapshot.data![index].name.toString()),
                            ResursRow(
                                value: "UserName",
                                title: snapshot.data![index].name.toString()),
                            ResursRow(
                                value: "Email",
                                title: snapshot.data![index].name.toString()),
                            ResursRow(
                                value: "Adress",
                                title: snapshot.data![index].address.city
                                    .toString()),
                            ResursRow(
                                value: "GEO",
                                title: snapshot.data![index].address.geo.lat
                                    .toString()),
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
