// ignore_for_file: unused_element, avoid_print, unused_local_variable, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers, unused_field

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
  final List<Blog> _loadedBlogs = [];
  var _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadBlogs();
  }

  void _loadBlogs() async {
    final url = Uri.parse("https://dev.to/api/articles?username=dalenguyen");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        print(data);
        for (final blog in data) {
          _loadedBlogs.add(Blog(
            id: blog['id'].toString(),
            title: blog['title'],
            imageURL: blog['cover_image'],
            date: blog['readable_publish_date'],
            description: blog['description'],
          ));
        }
        //print(fetchedBlogs);
      } else {
        print('Failed to fetch blogs. Error: ${response.statusCode}');
      }
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print('Error occurred during the HTTP request: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: _loadedBlogs.length,
      itemBuilder: (ctx, index) => Padding(
        padding: EdgeInsets.only(top: 12, bottom: 12),
        child: GestureDetector(
          onTap: () {},
          child: Stack(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  image: DecorationImage(
                    image: NetworkImage(
                      _loadedBlogs[index].imageURL,
                      scale: 0.5,
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                bottom: 10.0,
                left: 10,
                child: Text(
                  _loadedBlogs[index].title,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                top: 20,
                right: 7,
                child: Text(
                  _loadedBlogs[index].date,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.left,
                ),
              )
            ],
          ),
        ),
      ),
    );

    if (_isLoading) {
      content = Center(child: CircularProgressIndicator());
    }
    return Scaffold(body: content);
  }
}
