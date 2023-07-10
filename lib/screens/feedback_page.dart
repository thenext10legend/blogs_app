// ignore_for_file: prefer_const_constructors, prefer_is_empty, unused_field, prefer_final_fields, unused_element, avoid_print

import 'package:blogs_app/screens/form_submitted.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class FeedbackSreen extends StatefulWidget {
  const FeedbackSreen({super.key});

  @override
  State<FeedbackSreen> createState() => _FeedbackSreenState();
}

class _FeedbackSreenState extends State<FeedbackSreen> {
  final _formKey = GlobalKey<FormState>();
  var _subject = '';
  var _body = '';
  var _email = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _formKey.currentState!.reset();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => FormSubmittedScreen()));
      print("SUBJECT:$_subject");
      print("BODY:$_body");
      print("EMAIL:$_email");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                "Feedback",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                maxLength: 50,
                decoration: InputDecoration(
                  label: Text(
                    "Subject",
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(
                      16,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length < 1 ||
                      value.trim().length > 50) {
                    return "Must be between 1 and 50 characters long.";
                  }
                  return null;
                },
                onSaved: (value) {
                  _subject = value!;
                },
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                maxLines: 5,
                decoration: InputDecoration(
                  label: Text(
                    "Body",
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(
                      16,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter the body.";
                  }
                  return null;
                },
                onSaved: (value) {
                  _body = value!;
                },
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(
                  label: Text(
                    "Email",
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(
                      16,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      EmailValidator.validate(value) == false) {
                    return "Please enter a valid Email Id.";
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      _formKey.currentState!.reset();
                    },
                    child: Text("Reset"),
                  ),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text("Submit"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
