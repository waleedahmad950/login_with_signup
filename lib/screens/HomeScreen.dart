
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_with_signup/assets/Iconproject.dart';
import 'package:login_with_signup/comm/getusernameFormField.dart';
import 'package:login_with_signup/model/user_model.dart';
import 'package:login_with_signup/screens/CarsHomeList.dart';
import 'package:login_with_signup/screens/LoginForm.dart';
import 'package:login_with_signup/screens/Profile.dart';
import 'package:login_with_signup/screens/messages.dart';
import 'package:login_with_signup/screens/navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex=0;
 User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

final tabs=[
CarsHomeList(),
messages(),
Profile(),
navigation(),
];

@override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
       /* appBar: 
        
        AppBar(
          toolbarHeight: 180.0,
          
          backgroundColor: Color.fromRGBO(63, 57, 57,1),
          
          title: const Text("THE SMART GARAGE"),
          centerTitle: true,
          
           shape: RoundedRectangleBorder(
             
             borderRadius: BorderRadius.vertical(
              
             bottom: Radius.circular(100.0),
             
          ),
           


        ),
        ),
*/


        body:tabs[currentIndex], /*Center(
          
          child: Padding(
            
            padding: EdgeInsets.all(5.0),
           
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: <Widget>[
              
                Text(
                  "Welcome  ""${loggedInUser.username}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
                  
                ),
                SizedBox(
                  height: 10,
                ),






/*
SizedBox(
                  height: 400.0,
                  
                ),
                ActionChip(
                    label: Text("Logout"),
                    onPressed: () {
                      logout(context);
                    }),



                 */
                
               
               
              
               
                
              ],

              
            ),
            
          ),

          




        ), */
        
        
  bottomNavigationBar:BottomNavigationBar(
currentIndex: currentIndex,
selectedItemColor: Colors.white,
backgroundColor:Color.fromRGBO(63, 57, 57,1),

onTap: (index)=>setState(() {
   currentIndex=index;
}),
  items: [

BottomNavigationBarItem(

icon: Icon(Iconproject.car_side),
label: 'Home',
backgroundColor: Color.fromRGBO(63, 57, 57,1),


),

BottomNavigationBarItem(
//Iconshelpproject.logo1
icon: const Icon(Iconproject.paper_plane),
label: 'messages',
backgroundColor: Color.fromRGBO(63, 57, 57,1),

),
      
BottomNavigationBarItem(

icon: Icon(Iconproject.user),
label: 'Profile',
backgroundColor:Color.fromRGBO(63, 57, 57,1),


),


BottomNavigationBarItem(

icon: Icon(Iconproject.bell),
label: 'navigation',
backgroundColor: Color.fromRGBO(63, 57, 57,1),

),




  ],
),

        









      
      );
   
  }
  /*

// the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginForm()));

  }
*/


  }

