import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_with_signup/Comm/getTextFormField.dart';
import 'package:login_with_signup/comm/getConfirmPasswordFromField.dart';
import 'package:login_with_signup/comm/getPasswordFromField.dart';
import 'package:login_with_signup/model/user_model.dart';
import 'package:login_with_signup/screens/HomeScreen.dart';
import 'package:login_with_signup/screens/LoginForm.dart';
import 'package:login_with_signup/comm/getusernameFormField.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({ Key? key }) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}
class _SignupFormState extends State<SignupForm> {
  var owner_user ='User';
  bool ischecked=false;
  bool passwordvissable=true;
  final _auth = FirebaseAuth.instance;
  
  // string for displaying the error Message
  String? errorMessage;


  // our form key
  final _formKey = GlobalKey<FormState>();
    // editing Controller

    final TextEditingController _conUserName = new TextEditingController();
    final TextEditingController _conUserEmail = new TextEditingController();
    final TextEditingController _conUserPassword = new TextEditingController();
    final TextEditingController _conUserConfirmPassword = new TextEditingController();
  @override
  Widget build(BuildContext context) {
  var children2 = [
               SizedBox(height: 10.0),

             Image.asset("assets/images/logo.png",
             
             height: 150.0,
             width: 150.0,
             
             ),
             SizedBox(height: 10.0),

             Text('Sign Up',
              style: TextStyle(
                
                fontWeight: FontWeight.bold,
                color:Colors.white,
                fontSize: 35.0,
               shadows: <Shadow>[
                 Shadow(
                    offset: Offset(0.0,9.0),
                    blurRadius: 9,
                   

                 ),


               ]
                 ),
              
              ),
             

getusernameFormField(
  
            controller:_conUserName,
            icon: Icons.person,
            inputType: TextInputType.name,
            hintName: 'User Name'),





            getTextFormField(
            controller:_conUserEmail,
            icon: Icons.email,
            inputType: TextInputType.emailAddress,
            hintName: 'Email'),







 
            getPasswordFromField(
            controller:_conUserPassword,
            icon: Icons.lock,
            inputType: TextInputType.visiblePassword,
            hintName: 'Password'),


            getConfirmPasswordFromField(
            controller:_conUserConfirmPassword,
            controller1:_conUserPassword,
            icon: Icons.lock,
            inputType: TextInputType.visiblePassword,
            hintName: 'Confirm Password',
            
            ),















              Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                
                children: [
                  Row(children: <Widget> [
                  Radio(value: 'User', groupValue: owner_user, onChanged:( val){
                     
                    setState(() {
                       owner_user= 'User';
                    });
                  } ),  
                  
                  const Text('User',
                  style: TextStyle(fontSize: 15.0,
                  color:Colors.white,
                  )
                  ),

                  ],),
                  
                  Row(children: [
                  Radio(value: 'Owner', groupValue:owner_user, onChanged:(val){
                   
                    setState(() {
                      owner_user= 'Owner';
                    });
                  } ), 

                  SizedBox(width: 10.0,),
                  const Text('Owner',
                  style: TextStyle(fontSize: 15.0,
                  color:Colors.white,
                  )
                  ),
                  ],
                  ),
 
                ],
              ),
              ),






                 Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
                  Text('I agree to the',style: TextStyle( 
                    
                  color:Color.fromARGB(255, 255, 255, 255),
                  ),
                  
                  
                  ),
                  
                  TextButton(onPressed: (){
                  } , 
          
                  child: Text('terms & condition') ,
                  style: ButtonStyle(
                      
                    foregroundColor: MaterialStateProperty.all(Colors.blue)
                   
                  ),

                  ),

Checkbox(
  value: ischecked, 
  onChanged: (bool? b){
       setState(() {
        ischecked=b!;
                       });

                       
                            },

),

                ],
              ),

              ),

              Container(
                margin: EdgeInsets.all(5.0),
               
                 
                                
                child: ElevatedButton(onPressed: ischecked?    () {
                   
                  signUp(_conUserEmail.text, _conUserPassword.text);

                } : null,
                  child: const Text('Create Account'
                  ,style: TextStyle(
                
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                
                  
                   ),
                  ),


                ),
                decoration: BoxDecoration(
                  //color: Color.fromARGB(255, 38, 0, 255),
                  borderRadius: BorderRadius.circular(30.0),
                  
                ),

              ),
              Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
                  Text('Dose You have account ?',style: TextStyle( 
                    
                  color:Colors.white,
                  ),
                  
                  
                  ),
                  
                  TextButton(onPressed: (){

                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>LoginForm()),
                    
                    (Route<dynamic>Route)=>false
                    );

                  } , 

                  
                  child: Text('Sign In') ,
                  style: ButtonStyle(
                      
                    foregroundColor: MaterialStateProperty.all(Colors.blue)
                  ),

                  ),

                ],

              ),

              ),

             
                SizedBox(height: 60.0),  
          ];
    return Scaffold(
      backgroundColor: Color.fromRGBO(63, 57, 57,1),
      body: SingleChildScrollView(
        
        scrollDirection: Axis.vertical,
        child: Container (
          
         padding: EdgeInsets.symmetric(horizontal: 20.0),
         margin: EdgeInsets.only(top: 7.0),
        color: const Color.fromRGBO(63, 57, 57,1),
        child: Center(
          child:Form(
            key: _formKey,
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: children2,
          
        ),
      
        ),
      ),
      ),
      ),


    );
  }
void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
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
  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.username = _conUserName.text;
    

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
  }
 
}