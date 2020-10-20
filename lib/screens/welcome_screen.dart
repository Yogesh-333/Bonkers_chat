import 'package:bonkers_chat/screens/login_screen.dart';
import 'package:bonkers_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bonkers_chat/components/selectionButtonWidget.dart';


class WelcomeScreen extends StatefulWidget {
  static const id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset('images/logo.png'),
                      height: 60.0,
                    ),
                  ),
                  TextLiquidFill(
                    waveColor: Colors.black,
                    boxBackgroundColor: Colors.white,
                    text:'Bonkers Chat',
                    textStyle: TextStyle(
                      fontSize: 35.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                    boxHeight: 100.0,
                    boxWidth: 300,
                  ),
                ],
              ),
              SizedBox(
                height: 48.0,
              ),
              selectionButtonWidget(
                  color: Colors.lightBlueAccent,
                  label: 'Log In',
                  onPressed: (){
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  ),
              selectionButtonWidget(
                color: Colors.blueAccent,
                label: 'Register',
                onPressed: (){
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

