import 'package:flutter/material.dart';
import 'package:login_with_signup/comm/getTextFormField.dart';
import 'package:login_with_signup/screens/LoginForm.dart';
import 'package:login_with_signup/screens/SignupForm.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({ Key? key }) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  
  TextEditingController _conUserEmail = new TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(63, 57, 57,1),
      body: SingleChildScrollView(
        
        scrollDirection: Axis.vertical,
        child: Container (
         padding: EdgeInsets.symmetric(horizontal: 20.0),
         margin: const EdgeInsets.only(top: 20.0),
          color: const Color.fromRGBO(63, 57, 57,1),
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
               SizedBox(height: 60.0),

             Image.asset("assets/images/logo.png",
             
             height: 220.0,
             width: 220.0,
             ),
             Text('Forgot Your Password?',
              style: TextStyle(
                
                fontWeight: FontWeight.bold,
                color:Colors.white,
                fontSize: 33.0,
                
               shadows: <Shadow>[
                 Shadow(
                    offset: Offset(0.0,9.0),
                    blurRadius: 9,
                   

                 ),

               ]
                 ),
              ),

              SizedBox(height: 40.0),
              Text("Enter your Email address and we'll  send  you  a  link to rest your password.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color:Colors.white,
                fontSize: 25.0,
               
                 ),
              
              ),
/*
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                  margin: EdgeInsets.only(top: 40.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(

                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide : BorderSide(color: Colors.transparent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            borderSide : BorderSide(color: Colors.blue),


                        ),
                        prefixIcon: Icon(Icons.email),
                        hintText: 'Email',
                        fillColor: Colors.grey[200],
                        filled: true,
                        

                      ),
                      keyboardType: TextInputType.emailAddress,               
                  ),


              ),
              
*/
getTextFormField(
            controller:_conUserEmail,
            icon: Icons.email,
            inputType: TextInputType.emailAddress,
            hintName: 'Email'),



              SizedBox(height: 20.0),

              Container(
                margin: EdgeInsets.all(20.0),
               
                 
                 width: double.infinity,               
                child: TextButton(onPressed: () async{
                  await FirebaseAuth.instance.sendPasswordResetEmail(email:_conUserEmail.text).then((value) {


                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginForm()));
                  });
                },
                  child: const Text('Send Link ',style: TextStyle(
                
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                
                  
                   ),
                  ),


                ),

                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 38, 0, 255),
                  borderRadius: BorderRadius.circular(30.0),           
                ),

              ),
              SizedBox(height: 20.0),
              Container(
              child: Row(
                
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
                  Text(' Not a member ?',style: TextStyle( 
                    
                  color:Colors.white,
                  ),
                  
                  
                  ),
                  
                  TextButton(onPressed: (){

                    Navigator.push(context, MaterialPageRoute(builder: (_)=>SignupForm()));

                  } , 
                  
                  
                  child: Text('Sign Up!') ,
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
      )
      )
      
    );
  }
}