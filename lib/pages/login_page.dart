import 'package:flutter/material.dart';
import 'package:SomaiyaChat/services/auth/auth_service.dart';
import 'package:SomaiyaChat/components/button.dart';
import 'package:SomaiyaChat/components/textfield.dart';

class LoginPage extends StatelessWidget {
  // email and password controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  // to redirect to register page when tapped
  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  //login methond
  void login(BuildContext context) async {
    //auth service
    final authService = AuthService();

    //try again if failed
    try {
      await authService.signInWithEmailPassword(
        _emailController.text,
        _passController.text,
      );
    }

    //catch if any errors
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(
              height: 50,
            ),

            //welcome back msg
            Text(
              "Welcome Back to SomaiyaChat!!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),

            const SizedBox(
              height: 25,
            ),
            //pw textfield
            MyTextField(
              hintText: "Enter Somaiya Email",
              obscureText: false,
              controller: _emailController,
            ),

            const SizedBox(height: 10),

            MyTextField(
              hintText: "Enter Password",
              obscureText: true,
              controller: _passController,
            ),

            const SizedBox(height: 25),

            //login button
            MyButton(
              text: "L O G I N",
              onTap: () => login(context),
            ),

            const SizedBox(height: 25),

            //register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not A User Yet?",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Become One",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
