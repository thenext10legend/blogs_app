// ignore_for_file: prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace, prefer_final_fields

import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var _name = "Shivam Jhunjhunwala";
  var _username = "thenext10legend";
  var _email = "1032201696@mitwpu.edu.in";
  var _contact = 8329089978;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(
            left: 15,
            top: 20,
            right: 15,
          ),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: Colors.white,
                        ),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(
                              0.1,
                            ),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://media.istockphoto.com/id/1440483244/photo/soccer-stadium-ball-center-midfield.jpg?s=2048x2048&w=is&k=20&c=eWoLjfnDhZaGOtG57lKq25oFUrF-VC5ydieBuoqJ8LM="),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 4,
                      bottom: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Colors.white,
                          ),
                          color: Colors.blue,
                        ),
                        child: IconButton(
                          padding: EdgeInsets.only(
                            right: 0.5,
                          ),
                          icon: Icon(Icons.edit),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                buildTextField("Name", _name.toString()),
                buildTextField("Username", _username.toString()),
                buildTextField("Email", _email.toString()),
                buildTextField("Contact", _contact.toString()),
                SizedBox(
                  height: 30,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     OutlinedButton(
                //       onPressed: () {},
                //       child: Text(
                //         "CANCEL",
                //         style: TextStyle(
                //           fontSize: 15,
                //           letterSpacing: 2,
                //           color: Colors.black,
                //         ),
                //       ),
                //       style: OutlinedButton.styleFrom(
                //         padding: EdgeInsets.symmetric(
                //           horizontal: 50,
                //         ),
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(20),
                //         ),
                //       ),
                //     ),
                //     ElevatedButton(
                //       onPressed: () {},
                //       child: Text(
                //         "SAVE",
                //         style: TextStyle(
                //           fontSize: 15,
                //           letterSpacing: 2,
                //           color: Colors.white,
                //         ),
                //       ),
                //       style: ElevatedButton.styleFrom(
                //         backgroundColor: Colors.blue,
                //         padding: EdgeInsets.symmetric(
                //           horizontal: 50,
                //         ),
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(20),
                //         ),
                //       ),
                //     )
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 30,
      ),
      child: TextField(
        readOnly: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 5),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
