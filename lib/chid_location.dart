import 'package:flutter/material.dart';
import 'childinfo.dart';

class Childloc extends StatelessWidget{


@override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.of(context).pushReplacementNamed('info');

      },
      child: Scaffold(
         body:Container(
       decoration: BoxDecoration(
         image: DecorationImage(
           image: AssetImage("images/c_loc.jpg"),
           fit: BoxFit.cover,

         )
       ),



  
        child: Column(
        
         
          children: <Widget>[
            SizedBox(height: 70),
            Row(
              children: <Widget>[
                Icon(Icons.pin_drop),
                
                GestureDetector(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushReplacementNamed('gps');
                    },
                    child: Text(
                      "Current Location",
                      style: TextStyle(
                      fontWeight: FontWeight.bold, 
                      fontSize: 28,
                      color: Colors.pink[400],
                      
                      ),
                    ),
                  ),

                )


              ]

            )


            


          ]
          ),
     ),
     )
     );
  }
  }