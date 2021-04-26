import 'package:children_care/auth.dart';
import 'package:flutter/material.dart';
import 'homescreen.dart';
import 'original_button.dart';
import 'auth.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget{

 final AuthType authType;

  const Signup({Key key, @required this.authType}) : super(key: key);

  @override
  _Signup createState() => _Signup();
   
  }

class _Signup extends State<Signup>{

 final _formkey = GlobalKey<FormState>();
 String _email = '', _password = '';
 

 void _showErrorDialog(String message){
 showDialog(
  context: context,
  builder: (ctx) => AlertDialog(
   title: Text(message),
   actions: <Widget> [
     FlatButton(
       child: Text('Okay'),
       onPressed: (){
         Navigator.of(ctx).pop();
       }, )
   ],


  )
 );


 }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30 ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
        TextFormField(
          onChanged: (value) => _email = value,
 
              validator: (value) =>
                  value.isEmpty ? 'You must enter a valid email' : null,

             decoration: InputDecoration(
               labelText: 'Enter your email',
               hintText: 'ex: test@gmail.com',

               filled: true,
        fillColor: Colors.white54,
        enabledBorder: OutlineInputBorder(
        borderSide:BorderSide(color: Colors.purple[400]),
        borderRadius:BorderRadius.circular(15)  ),

         focusedBorder: OutlineInputBorder(
        borderSide:BorderSide(color: Colors.purple[400]),
        borderRadius:BorderRadius.circular(10) ,
         ),
 

        disabledBorder: OutlineInputBorder(
        borderSide:BorderSide(color: Colors.purple[400]),
        borderRadius:BorderRadius.circular(10)  ),
              ),
           ),
            SizedBox(height: 20),


        TextFormField(

           onChanged: (value) => _password = value,

           validator: (value) => value.length <= 6
                  ? 'Your password must be larger than 6 characters'
                  : null,

             decoration: InputDecoration(
               labelText: 'Enter your password',
              
               filled: true,
        fillColor: Colors.white54,
        enabledBorder: OutlineInputBorder(
        borderSide:BorderSide(color: Colors.purple[400]),
        borderRadius:BorderRadius.circular(15)  ),

         focusedBorder: OutlineInputBorder(
        borderSide:BorderSide(color: Colors.purple[400]),
        borderRadius:BorderRadius.circular(10) ,
         ),
 

        disabledBorder: OutlineInputBorder(
        borderSide:BorderSide(color: Colors.purple[400]),
        borderRadius:BorderRadius.circular(10)  ),
             
              ),
              obscureText: true,
           ),
           SizedBox(height: 35),
           OriginalButton( 
             

               text: widget.authType == AuthType.login ? 'Login' : 'Register',
              onPressed: ()async{
                if (_formkey.currentState.validate()){
                      try{
                        if(widget.authType == AuthType.login){
                     await Provider.of<Auth>(context , listen: false).Login(_email, _password);
                       Navigator.of(context).pushReplacementNamed('info');
                     
                      }
                      else{
                     await Provider.of<Auth>(context , listen: false).SingUp(_email, _password);
                      
                       Navigator.of(context).pushReplacementNamed('login');
                      }
                      }catch(error){
                        _showErrorDialog(error);

                      }

                }
              },
              color: Colors.white60,
              textColor: Colors.purple[600],
            ),

            FlatButton(onPressed:(){
              if (widget.authType == AuthType.login) {
              Navigator.of(context).pushReplacementNamed('register');
              print(widget.authType);
              }
            else 
              Navigator.of(context).pushReplacementNamed('login');
            
            },
             child: Text(
                widget.authType == AuthType.login
                ? 'Don\'t have an account?'
                : 'Already have an account?',
               style: TextStyle(
                 color: Colors.purple[600],
                 fontSize: 20
               ),
               
               ),
             ),

          ],
        ),
      ),

    );
   
  }
}

