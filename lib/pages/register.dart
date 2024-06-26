import 'package:flutter/material.dart';
import 'package:SomaiyaChat/services/auth/auth_service.dart';
import 'package:SomaiyaChat/components/button.dart';
import 'package:SomaiyaChat/components/textfield.dart';

class RegisterPage extends StatelessWidget {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _cnfpassController = TextEditingController();


  final void Function () ? onTap;

  RegisterPage({super.key,required this.onTap});


  //register func
  void register(BuildContext context) {
    //get auth services
    final _auth = AuthService();


    //if password match then creates user
    if(_passController.text ==_cnfpassController.text) {
      try {
        _auth.signUpWithEmailPassword(_emailController.text, _passController.text);
      }catch (e){
        showDialog(context: context, 
        builder: (context) => AlertDialog(
        title: Text(e.toString()),
      ),
      ); 
      }
    }
    //password dont match => tell user t fix
    else{
      showDialog(context: context,
      builder: (context) => const AlertDialog(
        title: Text("Passwords Dont Match Try Again"),
      ),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body:   Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          // logo
          Icon(Icons.message,
          size: 60,
          color: Theme.of(context).colorScheme.primary,
          ),


        const SizedBox(height: 50,),


          //welcome back msg
          Text("Lets Get You Started !",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 16,
          ),
          ),
        
        const SizedBox(height: 25,),
          //pw textfield
          MyTextField(
            hintText: "Enter Your SomaiyaID",
            obscureText: false,
            controller: _emailController,
          ),
        
        const SizedBox(height: 10),
        //password
        MyTextField(
            hintText: "Enter Password",
            obscureText: true,
            controller: _passController,
          ),

          const SizedBox(height: 10),
        //cnf password
        MyTextField(
            hintText: "Confirm Your Password",
            obscureText: true,
            controller: _cnfpassController,
          ),

          const SizedBox(height: 25),
        

          //login button
          MyButton(
            text: "R E G I S T E R",
            onTap: ()=> register(context), //navigator
          ),
        


          const SizedBox(height: 25),

          //register now
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already Registered? ",
              
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary
              ),
              ),




              GestureDetector(
                onTap: onTap,
                child: Text("Login Now!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary
                ),
                ),
              ),
            ],
          ),
        ],),
      ),
    );
  }
}
