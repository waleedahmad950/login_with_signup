import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:login_with_signup/comm/getPasswordFromField.dart';
import 'package:login_with_signup/screens/SignupForm.dart';



class getConfirmPasswordFromField extends StatelessWidget {
TextEditingController controller;
String hintName;
IconData icon;
bool isobscureText;
TextInputType inputType;
TextEditingController controller1;
getConfirmPasswordFromField(
  
  {required this.controller,required this.controller1,required this.hintName,required this.icon,this.isobscureText=true,required this.inputType,});

  @override
  Widget build(BuildContext context) {
    return Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                  margin: EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    autofocus: false,
                    controller:controller,
                    obscureText:isobscureText ,
                    keyboardType: inputType=TextInputType.text,
                   
validator: (value) {

RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Confirm Password is required ");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }

           if (controller.text != controller1.text
              ) {
            return "Password don't match";
          }
          return null;
        },
        
        onSaved: (value) {
          controller.text = value!;
        },
        textInputAction: TextInputAction.done,

                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(

                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide : BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            borderSide : BorderSide(color: Colors.blue),

                        ),
                        prefixIcon: Icon(icon),
                        hintText: hintName,
                        fillColor: Colors.grey[200],
                        filled: true,
                      

                      
                      ),

                  ),

              );
  }
}