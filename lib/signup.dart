import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'home.dart';
import 'login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailcont = TextEditingController();
  TextEditingController passwordcont = TextEditingController();
  void login(String email, password)async{
    try{
     Response response = await post(
       Uri.parse("https://seowebdesign.in/feelathome/site/api/v1/login"),
       body: {
         'email' : email,
         'password' : password,
       }
     );
     if(response.statusCode == 200) {
       print("account created");
     }else{
       print("failed");
     }
    }catch(e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailcont,
                decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: passwordcont,
                decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(height: 25),
              GestureDetector(
                onTap: () {
                  login(emailcont.text.toString(), passwordcont.text.toString());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  height: 50,
                  width: 200,
                  child: Center(
                    child: Text(
                      'register'.toUpperCase(),
                      style: TextStyle(color: Colors.green, fontSize: 25),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//https://stackoverflow.com/questions/50049683/flutter-gesturedetector-ontap-gets-triggered-automatically-how-to
