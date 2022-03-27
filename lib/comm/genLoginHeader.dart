import 'package:flutter/material.dart';

class genLoginHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(

children: [

SizedBox(height: 60.0),

             Image.asset("assets/images/logo.png",
             
             height: 270.0,
             width: 270.0,
             ),
             
             Text('THE SMART GARAGE',
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



],

      ),
    );
  }
}

