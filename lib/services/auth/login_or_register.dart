import 'package:flutter/material.dart';
import 'package:SomaiyaChat/pages/login_page.dart';
import 'package:SomaiyaChat/pages/register.dart';


class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {

  //at first show login page
  bool showLoginPage=true;

  //toggle b/w login and register
  void togglePages() {
    setState(() {
      showLoginPage =!showLoginPage;
    });
  }



  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(
        onTap: togglePages,
      );
    }else{
      return RegisterPage(
        onTap: togglePages,
      );
    }
  }
}