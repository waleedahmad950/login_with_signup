import 'package:flutter/material.dart';
import 'package:login_with_signup/assets/Iconproject.dart';
import 'package:login_with_signup/screens/CarsHomeList.dart';
import 'package:login_with_signup/screens/Carsdatamodel.dart';
import 'package:login_with_signup/screens/HomeScreen.dart';
import 'package:login_with_signup/screens/Profile.dart';
import 'package:login_with_signup/screens/messages.dart';
import 'package:login_with_signup/screens/navigation.dart';

class Cars extends StatefulWidget {
  const Cars(String namesfild, { Key? key }) : super(key: key);

  @override
  State<Cars> createState() => _CarsState();
}

class _CarsState extends State<Cars> {
int currentIndex=0;
final tabs=[
CarsHomeList(),
messages(),
Profile(),
navigation(),

];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
    
      appBar: 
      
      AppBar(
        toolbarHeight: 180.0,
        
        backgroundColor: Color.fromRGBO(63, 57, 57,1),
        
        title: const Text("THE SMART GARAGE ,Cars"),
        centerTitle: true,
        
         shape: RoundedRectangleBorder(
           
           borderRadius: BorderRadius.vertical(
            
           bottom: Radius.circular(100.0),
           
        ),
         


      ),
      ),


body: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Dose not have account ?',style: TextStyle( 
                    
                  color:Colors.white,
                  ),
                  
                  
                  ),

                  TextButton(onPressed: (){

                    Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeScreen()));
                  } , 
                  
                  child: Text('Back ') ,
                  style: ButtonStyle(
                      
                    foregroundColor: MaterialStateProperty.all(Colors.blue)
                  ),
                   
                  ),

                ],

              ),

              ),


    );
        
  }

}


