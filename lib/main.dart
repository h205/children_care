
import 'package:children_care/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth.dart';
//import 'signup.dart';
import 'firstscreen.dart';
import 'gps_form.dart';
import 'homescreen.dart';
import 'childinfo.dart';
import 'chid_location.dart';



void main()async {

  WidgetsFlutterBinding.ensureInitialized();

     runApp(
      ChangeNotifierProvider<Auth>(
        create: (_) => Auth(),
      
      child: MyApp(),
      ),
      );
      
 
  //runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     
      home: Getstart(),
       routes: {
        'loc': (context) => Childloc(),
        'info': (context) => Childinfo(),
        'gps': (context) => GpsForm(),
        'home': (context) => Homescreen(),
        'login': (context) => Homescreen(authType: AuthType.login),
        'register': (context) => Homescreen(authType: AuthType.register),
      },
      
    );
  }
}

