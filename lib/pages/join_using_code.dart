
import 'package:SomaiyaChat/consts/consts.dart';
import 'package:flutter/material.dart';

class JoinCode extends StatelessWidget {
  TextEditingController _controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title: const Text("Join Using Code"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.red,
      ),

      body: Column(
        children: [
          const SizedBox(height: 50,width: 50,),
          Center(child: Image.network(ImageUrl2)
          ),

          const SizedBox(height: 25,width: 20,),

          const Text("Enter Meeting Code Below",
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            wordSpacing: 2.5,
            color: Colors.red,
          ),),

        const SizedBox(height: 30,),

        ElevatedButton(
          onPressed: (){
            //join button
          
          },

          

          child:  Text("Join"),
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(250, 30),
            shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
          ),
        ),

        const SizedBox(height: 30,),

        

          
        ],
      ),
    );
  }
}