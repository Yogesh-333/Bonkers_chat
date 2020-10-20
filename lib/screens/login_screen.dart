import 'package:flutter/material.dart';
import 'package:bonkers_chat/components/selectionButtonWidget.dart';
import 'package:bonkers_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  String email;
  String password;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email=value;
                },
                decoration: KTextFieldDecoration.copyWith(hintText: 'Enter email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password=value;
                },
                decoration:KTextFieldDecoration.copyWith(hintText: 'Enter password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              selectionButtonWidget(
                color: Colors.lightBlueAccent,
                label:'Log In',
                onPressed: ()async{
                  setState(() {
                    showSpinner=true;
                  });
                  try{
                    final newUser = await _auth.signInWithEmailAndPassword(email: email, password: password);
                    if (newUser != null){
                      Navigator.pushNamed(context, ChatScreen.id);
                       }
                    setState(() {
                      showSpinner=false;
                    });
                     }
                  catch (e) {
                         print(e);
                   }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
