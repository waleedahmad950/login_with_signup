import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:login_with_signup/Comm/getTextFormField.dart';
import 'package:login_with_signup/screens/ForgotPassword.dart';
import 'package:login_with_signup/screens/HomeScreen.dart';
import 'package:login_with_signup/screens/SignupForm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_with_signup/comm/genLoginHeader.dart';
import 'package:login_with_signup/comm/getPasswordFromField.dart';

class LoginForm extends StatefulWidget {

  @override
  State<LoginForm> createState() => _LoginFormState();
}
bool passwordvissable=true;
class _LoginFormState extends State<LoginForm> {
 
 // form key
  
final _formKey = GlobalKey<FormState>();


final TextEditingController _conUserEmail =new TextEditingController();
final TextEditingController _conUserPassword =new TextEditingController();

// firebase
  final _auth = FirebaseAuth.instance;

 // string for displaying the error Message
  String? errorMessage;
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(63, 57, 57,1),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container (
         padding: EdgeInsets.symmetric(horizontal: 20.0),
         margin: EdgeInsets.only(top: 20.0),
          color: const Color.fromRGBO(63, 57, 57,1),
        child: Center(
        child: Form(
          key:_formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          genLoginHeader(),

           //email field

           getTextFormField(
            controller:_conUserEmail,
            icon: Icons.email,
            inputType: TextInputType.emailAddress,
            hintName: 'Email Address',
            ),



            
            getPasswordFromField(
            controller:_conUserPassword,
            icon: Icons.lock,
            inputType: TextInputType.visiblePassword,
            hintName: 'Password'
            
            ),





            SizedBox(height: 20.0),
              Container(
                child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
              
                children: [
                  
                  TextButton(onPressed: (){

                    Navigator.push(context, MaterialPageRoute(builder: (_)=>ForgotPassword()));

                  } ,  
                  child: Text('        Forgot Password?') ,
                  style: ButtonStyle(
                     
                    foregroundColor: MaterialStateProperty.all(Colors.blue)
                  ),
                 
                  ),

                ],

              ),

              ),

              Container(
                margin: EdgeInsets.fromLTRB(100, 10, 100, 10),
                 width: double.infinity,               
                child: TextButton(onPressed: () {
                  
                signIn(_conUserEmail.text,_conUserPassword.text);
                 
                },
                  child: const Text('Login',style: TextStyle(
                
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25.0, 
                   ),
                  ),

                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
               
                ),

              ),
              Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Dose not have account ?',style: TextStyle( 
                    
                  color:Colors.white,
                  ),
                  
                  
                  ),

                  TextButton(onPressed: (){

                    Navigator.push(context, MaterialPageRoute(builder: (_)=>SignupForm()));
                  } , 
                  
                  child: Text('Sign Up') ,
                  style: ButtonStyle(
                      
                    foregroundColor: MaterialStateProperty.all(Colors.blue)
                  ),
                   
                  ),

                ],

              ),

              ),

          ],
          
        ),
      ),
      ),
      ),
      ),
    );
  }


  // login function
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login Successful"),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomeScreen())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }
  
    
  }