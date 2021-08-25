import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:login_ui/widgets/input_widgets.dart';
import 'package:login_ui/widgets/outline_button.dart';
import 'package:login_ui/widgets/primary_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _pageState = 0;
  var _backgroundColor = Colors.white;
  var _headingColor = Color(0xFFB40284A);

  double _loginYOffset = 0;
  double _loginXOffset = 0;
  double _registerYOffset = 0;

  double? _loginWidth;
  double? _loginHeight;
  double? _registerHeight;

  double _loginOpacity = 1;

  double _headingTop = 100;

  double windowsWidth = 0;
  double windowsHeight = 0;
  bool _keyboardVisible = false;

  @override
  Widget build(BuildContext context) {
    windowsHeight = MediaQuery.of(context).size.height;
    windowsWidth = MediaQuery.of(context).size.width;
    _loginHeight = windowsHeight - 270;
    _registerHeight = windowsHeight - 270;
    switch (_pageState) {
      case 0:
        _backgroundColor = Colors.white;
        _headingColor = Color(0xFFB40284A);

        _loginYOffset = windowsHeight;
        _registerYOffset = windowsHeight;
        _loginXOffset = 0;

        _loginWidth = windowsWidth;
        _headingTop = 100;
        _loginOpacity = 1;
        break;
      case 1:
        _backgroundColor = Color(0xFFBD34C59);
        _headingColor = Colors.white;
        _loginYOffset = 270;
        _registerYOffset = windowsHeight;
        _loginXOffset = 0;

        _loginWidth = windowsWidth;

        _headingTop = 90;

        _loginOpacity = 1;

        break;
      case 2:
        _backgroundColor = Color(0xFFBD34C59);
        _headingColor = Colors.white;
        _loginYOffset = 240;
        _registerYOffset = 270;
        _loginXOffset = 20;

        _headingTop = 80;

        _loginWidth = windowsWidth - 40;

        _loginOpacity = 0.7;
        break;
    }
    return Stack(
      children: [
        AnimatedContainer(
          color: _backgroundColor,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(seconds: 1),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _pageState = 0;
                    });
                  },
                  child: Container(
                      child: Column(
                    children: [
                      AnimatedContainer(
                        curve: Curves.fastLinearToSlowEaseIn,
                        duration: Duration(seconds: 1),
                        margin: EdgeInsets.only(top: _headingTop),
                        child: Text(
                          "Learn Free",
                          style: TextStyle(color: _headingColor, fontSize: 28),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: Text(
                          "We make learning easy, Join or SignIn to learn flutter for free on youtube",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: _headingColor, fontSize: 16),
                        ),
                      ),
                    ],
                  )),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Center(
                    child: Image.asset("assets/splash_bg.png"),
                  ),
                ),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      if (_pageState != 0) {
                        _pageState = 0;
                      } else {
                        _pageState = 1;
                      }
                      setState(() {});
                    },
                    child: Container(
                      margin: EdgeInsets.all(32),
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Color(0xFFB40284A),
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                          child: Text(
                        'Get Started',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedContainer(
          padding: EdgeInsets.all(32),
          width: _loginWidth,
          height: _loginHeight,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(seconds: 1),
          transform: Matrix4.translationValues(_loginXOffset, _loginYOffset, 1),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(_loginOpacity),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: [
                        Text(
                          'Login To Continue',
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  InputWithIcons(
                    hint: 'Enter Email...',
                    icon: Icons.email,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InputWithIcons(
                    hint: 'Enter Password',
                    icon: Icons.vpn_key,
                  ),
                ],
              ),
              Column(
                children: [
                  PrimaryButton(
                    btnText: 'Log In',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _pageState = 2;
                        });
                      },
                      child: OutlineBtn(btnText: 'Create New Account')),
                ],
              ),
            ],
          ),
        ),
        AnimatedContainer(
          height: _registerHeight,
          padding: EdgeInsets.all(32),
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          transform: Matrix4.translationValues(0, _registerYOffset, 1),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Create a New Account",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  InputWithIcons(
                    icon: Icons.email,
                    hint: "Enter Email...",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InputWithIcons(
                    icon: Icons.vpn_key,
                    hint: "Enter Password...",
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  PrimaryButton(
                    btnText: "Create Account",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _pageState = 1;
                      });
                    },
                    child: OutlineBtn(
                      btnText: "Back To Login",
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
