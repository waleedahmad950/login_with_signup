import 'package:flutter/material.dart';


class getPasswordFromField extends StatelessWidget {

TextEditingController controller;
String hintName;
IconData icon;
bool isobscureText;
TextInputType inputType;
getPasswordFromField(
  
  {required this.controller,required this.hintName,required this.icon,this.isobscureText=true,required this.inputType});


  @override
  Widget build(BuildContext context) {
    return Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                  margin: EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                     autofocus: false,
                    controller:controller,
                    obscureText:true ,
                    keyboardType: inputType=TextInputType.text,
          
validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required ");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
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




