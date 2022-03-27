import 'package:flutter/material.dart';
import 'package:login_with_signup/assets/Iconproject.dart';
import 'package:login_with_signup/screens/Cars.dart';
import 'package:login_with_signup/screens/CarsHomeList.dart';
import 'package:login_with_signup/screens/Carsdatamodel.dart';
import 'package:login_with_signup/screens/HomeScreen.dart';
import 'package:login_with_signup/screens/Profile.dart';
import 'package:login_with_signup/screens/messages.dart';
import 'package:login_with_signup/screens/navigation.dart';


class AddCar extends StatefulWidget {
  const AddCar(String namesfild, { Key? key}) : super(key: key);

  @override
  State<AddCar> createState() => _AddCarState();
}
 int currentIndex=0;
class _AddCarState extends State<AddCar> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
    
      appBar: 
      
      AppBar(
        toolbarHeight: 180.0,
        
        backgroundColor: Color.fromRGBO(63, 57, 57,1),
        
        title: const Text("THE SMART GARAGE ,ADD CAR"),
        centerTitle: true,
        
         shape: RoundedRectangleBorder(
           
           borderRadius: BorderRadius.vertical(
            
           bottom: Radius.circular(100.0),
           
        ),
         


      ),
      ),

body:Container(
  
    margin: const EdgeInsets.all(30.0),
    padding: const EdgeInsets.all(10.0),
    decoration: myBoxDecoration(), //       <--- BoxDecoration here
    child: 
   
    Text(
      "       Add Car       ",
      style: TextStyle(fontSize: 35.0),
    ),
    
  ),


    );
        
  }

}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border.all(
      color: Colors.red, //                   <--- border color
      width: 2.0,
    ),
     borderRadius: BorderRadius.all(
        Radius.circular(25.0) //         <--- border radius here
    ),
  );
}


