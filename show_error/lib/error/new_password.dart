// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';



class NewPassword extends StatefulWidget {
  static const String id = "NewPassword";
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

    String errorMessage = "minimum 6 maximum 10 character";
    String errorMessage2 = "One smal one capital";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Password"),),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
                SizedBox(height: 40),
                Text("new_password"),
                TextFormField(
                  controller: _newPasswordController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: "******",
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      if (value!.isEmpty) {
                        setState(() {
                          print("empty now");
                          "require 1";
                          "require 2";
                        });
                      }
                       if (value.length < 6 || value.length > 10) {
                        setState(() {
                          print(" 6 <> 10 now");
                        
                        });
                      }

                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) return "password is required";

                    return null;
                  },
                ),

                /*
                * JUST SHOW THESE 3 lines when user will type the password
                * Not sure not after pressing the button
                *Thats it
                */

                //Password must be 6-10 characters
                //Include upper and lower case characters
                //Include one alphanumeric character

                SizedBox(height: 15),
                Text("confirm_password"),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: "******",
                  ),
                  validator: (value) {
                    if (value! != _newPasswordController.text) return "password doesn't match";
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    
    );
  }
}
