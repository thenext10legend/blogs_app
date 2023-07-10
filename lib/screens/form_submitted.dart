// ignore_for_file: prefer_const_constructors, unused_field, use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';

class FormSubmittedScreen extends StatefulWidget {
  const FormSubmittedScreen({super.key});

  @override
  State<FormSubmittedScreen> createState() => _FormSubmittedScreenState();
}

class _FormSubmittedScreenState extends State<FormSubmittedScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animationController.forward();
    navigateToPreviousScreen();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void navigateToPreviousScreen() async {
    await Future.delayed(Duration(seconds: 3)); // Delay for 5 seconds
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Container(
                      width: 0 + (_animationController.value * 130),
                      height: 0 + (_animationController.value * 130),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blueGrey,
                      ),
                    );
                  },
                ),
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Positioned(
                      top: 42,
                      left: 42,
                      child: Icon(
                        Icons.done,
                        size: 0 + (_animationController.value * 50),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Text(
                  "Thank You for your Feedback!",
                  style: TextStyle(
                    fontSize: 0 + (_animationController.value * 20),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
