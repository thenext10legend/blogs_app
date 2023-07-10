// ignore_for_file: unused_element, avoid_print, unused_local_variable, sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers, unused_field

import 'dart:convert';

import 'package:blogs_app/models/blog.dart';
import 'package:blogs_app/screens/blog_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Blog> _loadedBlogs = [];
  var _isLoading = true;
  String? _error;

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
        for (final blog in data) {
          _loadedBlogs.add(Blog(
            id: blog['id'].toString(),
            title: blog['title'],
            imageURL: blog['cover_image'],
            date: blog['readable_publish_date'],
            description: blog['description'],
          ));
        }
      } else {
        print('Failed to fetch blogs. Error: ${response.statusCode}');
      }
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print('Error occurred during the HTTP request: $e');
      setState(() {
        _error = "Something went wrong pls try again later";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: _loadedBlogs.length,
      itemBuilder: (ctx, index) => Padding(
        padding: EdgeInsets.only(top: 12, bottom: 12),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => BlogDetailsScreen(
                  id: _loadedBlogs[index].id,
                  title: _loadedBlogs[index].title,
                  description: _loadedBlogs[index].description,
                  imageURL: _loadedBlogs[index].imageURL,
                ),
              ),
            );
          },
          child: Stack(
            children: [
              Hero(
                tag: ValueKey(_loadedBlogs[index].id),
                child: FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(
                    _loadedBlogs[index].imageURL,
                  ),
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 44,
                  ),
                  color: Colors.black54,
                  child: Column(
                    children: [
                      Text(
                        _loadedBlogs[index].title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    if (_isLoading) {
      content = Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      content = Center(child: Text(_error!));
    }
    return Scaffold(body: content);
  }
}
