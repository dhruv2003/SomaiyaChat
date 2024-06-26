import 'package:SomaiyaChat/consts/consts.dart';
import 'package:SomaiyaChat/pages/join_using_code.dart';
import 'package:flutter/material.dart';

class VideoCall extends StatelessWidget {
  const VideoCall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("C O N F E R E N C E"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.red,
        elevation: 0,
        centerTitle: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20,40,0,0),
            child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text("New Meet",
                style: TextStyle(
                  color: Colors.redAccent,
                ),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(350, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.redAccent,
                ),
                ),
          ),


          const Divider(thickness: 1,height: 40,indent: 40,endIndent: 20,color: Colors.black26,),


          //join using code button
          Padding(
            padding: const EdgeInsets.fromLTRB(20,0,0,0),
            child: OutlinedButton.icon(
              onPressed: (){
                Navigator.pop(context);
                //navigate to Join using Code page
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) =>  JoinCode(),
                    )
                  );
              },
              icon: const Icon(Icons.keyboard_alt_outlined),
              label: const Text("Join using a Code"),
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(350, 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 85),

          //image
          Image.network(IMAGE_URL),
        ],
      ),
    );
  }
}
