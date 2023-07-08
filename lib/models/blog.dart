import 'package:flutter/material.dart';

class Blog {
  Blog({
    required this.id,
    required this.title,
    required this.image,
    required this.date,
  });

  final String id;
  final String title;
  final Image image;
  final DateTime date;
}
