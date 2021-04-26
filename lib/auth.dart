import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {

 

  Future<void> authenticate (String email , String password , String urlsegment ) async
  {
    final url ="https://identitytoolkit.googleapis.com/v1/accounts:$urlsegment?key=AIzaSyDGdiEq4VdInyu82X-QaHt-U6ZxJ3UaOno";

  try{
    final res = await http.post(url , body :json.encode({
      'email' : email,
      'password': password,
      'returnSecureToken': true,

    }));
    final resData = json.decode(res.body);
     if(resData['error'] != null){
       throw"${resData['error']['message']}";
     }

   
  }catch(e){
    throw e;

  }

  }

  Future<void> SingUp (String email , String password) async{
   return authenticate(email , password , "signUp");

  }

  Future<void> Login (String email , String password) async{
   return authenticate(email , password , "signInWithPassword");

  }

  



}