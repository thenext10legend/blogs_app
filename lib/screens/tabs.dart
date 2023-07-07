// ignore_for_file: prefer_final_fields, unused_field, no_leading_underscores_for_local_identifiers, prefer_const_constructors

import 'package:blogs_app/screens/feedback_page.dart';
import 'package:blogs_app/screens/home_page.dart';
import 'package:blogs_app/screens/profile_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _activePage = const HomePage();
    var _activePageTitle = "Blogs";

    if (_selectedPageIndex == 1) {
      _activePage = const ProfileScreen();
      _activePageTitle = "Profile";
    }
    if (_selectedPageIndex == 2) {
      _activePage = const FeedbackSreen();
      _activePageTitle = "Feedback Form";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_activePageTitle),
      ),
      body: _activePage,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        items: [
          Icon(
            Icons.home,
            size: 30,
            color: _selectedPageIndex == 0
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onBackground,
          ),
          Icon(
            Icons.account_circle,
            size: 30,
            color: _selectedPageIndex == 1
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onBackground,
          ),
          Icon(
            Icons.feedback,
            size: 30,
            color: _selectedPageIndex == 2
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onBackground,
          )
        ],
        onTap: (index) {
          _selectPage(index);
        },
      ),
    );
  }
}
