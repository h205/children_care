import 'package:children_care/signup.dart';
import 'package:flutter/material.dart';
import 'signup.dart';

enum AuthType { login, register }

class Homescreen extends StatelessWidget {
  
  final AuthType authType;

  const Homescreen({Key key, this.authType}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
                return Scaffold(    
                  resizeToAvoidBottomPadding: false, 
                       body:Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("images/family.jpg"),
                            fit: BoxFit.cover,

         )
       ),
                       
                       
                       
                       
                            child: Column(
                          
                              children: <Widget>[
                               
                                SizedBox(height: 250),
                              Signup(authType : authType),
                    
                  ],
                ),
              ),
            );
         
          
             
     
     
  }
}
