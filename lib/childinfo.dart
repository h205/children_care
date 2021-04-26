import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'original_button.dart';
import 'chid_location.dart';
import 'auth.dart';

class Childinfo extends StatelessWidget{

var id='1111';
TextEditingController id_value = new TextEditingController();

 showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = FlatButton(
    child: Text("Okay"),
    onPressed: () { 
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("error"),
    content: Text("Your Id incorrect."),
    
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
 


@override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
         Navigator.of(context).pushReplacementNamed('login');

      },
      child:Scaffold(

        body:Container(
       decoration: BoxDecoration(
         image: DecorationImage(
           image: AssetImage("images/id.jpg"),
           fit: BoxFit.cover,

         )
       ),
    
        child: Column(
          children: <Widget>[

            SizedBox(height: 50),
            Padding(
             padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
       child: TextFormField(     
          controller: id_value,
          onChanged: (value) => id,

            

         validator: (value) => value.isEmpty ? 'You must enter a valid id' : null,

           

             decoration: InputDecoration( 
        fillColor: Colors.white54,
        enabledBorder: OutlineInputBorder(
        borderSide:BorderSide(color: Colors.pink),
        borderRadius:BorderRadius.circular(15)  ),

         focusedBorder: OutlineInputBorder(
        borderSide:BorderSide(color: Colors.pink[400]),
        borderRadius:BorderRadius.circular(10) ,
         ),
         disabledBorder: OutlineInputBorder(
        borderSide:BorderSide(color: Colors.pink[400]),
        borderRadius:BorderRadius.circular(10)  ),
              ),
          
           obscureText: true,
           ),
            ),
         // SizedBox(height: 2),
          Padding(
             padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child:  OriginalButton(
        text: 'Submit',
        onPressed:(){

            if (id_value.text.toString()==id){

         Navigator.of(context).pushReplacementNamed('loc');
            }
            else if(id_value.text.toString()==" ") {
            
            } 
            else {

                showAlertDialog(context);
            }
           
            
            
            
        } ,
       

        color: Colors.pink[100],
        textColor: Colors.white,
        
      ),

 ),

          ]

          ), 
     ),
),
);
}
}