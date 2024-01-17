import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleTwo extends StatefulWidget {
  const ExampleTwo({super.key});

  @override
  State<ExampleTwo> createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {
  List<Photos> photoList = [];

  Future<List<Photos>> getPhotosApi() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (var i in data) {
        Photos photos = Photos(title: i['title'], url: i['url'], id: i['id']);
        photoList.add(photos);
      }
      return photoList;
    } else {
      return photoList;
    }
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
            future: getPhotosApi(),
            builder: (context, AsyncSnapshot<List<Photos>> snapshot) {
              return ListView.builder(
                itemCount: photoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(snapshot.data![index].url.toString()),
                    ),
                    subtitle: Text(snapshot.data![index].title.toString()),
                    title: Text(
                      "Api ID: ${snapshot.data![index].id.toString()}",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  );
                },
              );
            },
          )),
        ],
      ),
    );
  }
}

class Photos {
  String title, url;

  int id;

  Photos({required this.title, required this.id, required this.url});
}
