import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_with_signup/screens/AddCar.dart';
import 'package:login_with_signup/screens/Cars.dart';
import 'package:login_with_signup/screens/Carsdatamodel.dart';
import 'package:login_with_signup/screens/LoginForm.dart';

class CarsHomeList extends StatefulWidget {
  const CarsHomeList({ Key? key }) : super(key: key);

  @override
  State<CarsHomeList> createState() => _CarsHomeListState();
}

class _CarsHomeListState extends State<CarsHomeList> {

  static List<String> namesfild=['Add Car','Cars','Empty garage!','Come in/out history.'];

  static List <String> url =['assets/images/Home1.png','assets/images/Home2.png','assets/images/Home3.png','assets/images/Home4.png'];

final List<Carsdatamodel> Carsdata = List.generate(
  
  namesfild.length,
  (index)
  => Carsdatamodel('${namesfild[index]}','${url[index]}','${namesfild[index]} Description...') );


  @override
  Widget build(BuildContext context) {

    return Scaffold(
    
      appBar: AppBar(
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



                  
      body: ListView.builder(
           
           
           
           itemCount: namesfild.length,
          itemBuilder: (context,index){
             return Card(
               
               child: ListTile(
                 minVerticalPadding: 40.0,
                 
                 title: Text(namesfild[index]
                 
                 ),
                 leading: SizedBox(
                   width: 100,
                   height:100,
                   child: Image.asset(url[index]),
                   
                 ),
                 onTap: (){
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddCar(carsdatamodel: namesfild[index])));
                        //Navigator.push(context, MaterialPageRoute(builder: (_)=>AddCar()));             
                       if(namesfild[index]=='Add Car') {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  AddCar(namesfild[index])));}
                       if(namesfild[index]=='Cars') {Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  Cars(namesfild[index])));}
                        
      },
                        
               ),
             );
          }
          
      ),
    
    );
    
          
  }
    
}


