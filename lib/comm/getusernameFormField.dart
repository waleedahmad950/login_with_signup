
import 'package:flutter/material.dart';

class getusernameFormField extends StatelessWidget {

TextEditingController controller;
String hintName;
IconData icon;
bool isobscureText;
TextInputType inputType;

getusernameFormField(
  
  {required this.controller,required this.hintName,required this.icon,this.isobscureText=false,required this.inputType});


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
          RegExp regex = new RegExp(r'^.{5,}$');
          if (value!.isEmpty) {
            return ("User Name Can not be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid username(Min. 5 Character)");
          }
          return null;
        },
        onSaved: (value) {
          controller.text = value!;
        },
        textInputAction: TextInputAction.next,
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