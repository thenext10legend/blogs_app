// ignore_for_file: unused_element, avoid_print, unused_local_variable, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:blogs_app/models/blog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    //
    //_loadBlogs();
  }

  void _loadBlogs() async {
    final url = Uri.https("fakerestapi.azurewebsites.net/api/v1/Activities");
    final List<Blog> loadedBlogs = [];
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List<dynamic>;
        final fetchedBlogs = data.map((blogData) {
          return Blog(
            id: blogData['id'],
            title: blogData['title'],
            image: Image.network(
              blogData['url'],
            ),
            date: DateTime.now(),
          );
        }).toList();
        print(fetchedBlogs);
      } else {
        print('Failed to fetch blogs. Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred during the HTTP request: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 7,
        itemBuilder: (ctx, index) => Padding(
          padding: EdgeInsets.only(top: 16),
          child: Stack(children: [
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                // image: DecorationImage(
                //   image: "",
                //   fit: BoxFit.cover,
                // ),
              ),
            ),
            Positioned(
              bottom: 15.0,
              left: 15,
              child: Column(
                children: [
                  Text(
                    "TITLE",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "DATE",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
