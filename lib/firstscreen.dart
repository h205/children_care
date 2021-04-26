import 'package:flutter/material.dart';

//import 'homescreen.dart';
import 'original_button.dart';


class Getstart extends  StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        Navigator.pop(context);

      },
      child: Scaffold(

     
     body:Container(
       decoration: BoxDecoration(
         image: DecorationImage(
           image: AssetImage("images/gps.jpg"),
           fit: BoxFit.cover,

         )
       ),
    // child: SingleChildScrollView(
       
         
       child: Column(
          
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [ 
            
             SizedBox(height: 550),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                child: OriginalButton(
                  text: 'Get Started',
                  onPressed: ()=> Navigator.of(context).pushNamed('home'),
                  color: Colors.purple[500],
                  textColor: Colors.white,
                ),
              ),
           
         ],
               ),
          
           ),
    ),
    );
    
           
      
   
  }
}
