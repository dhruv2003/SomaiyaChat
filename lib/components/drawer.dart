import 'package:SomaiyaChat/pages/ai_mitra.dart';
import 'package:flutter/material.dart';
import 'package:SomaiyaChat/pages/lms_page.dart';
import 'package:SomaiyaChat/services/auth/auth_service.dart';
import 'package:SomaiyaChat/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    //get auth services
    final auth =AuthService();
    auth.signOut();

  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // logo
          DrawerHeader(child: Center(child: Icon(Icons.message,color: Theme.of(context).colorScheme.primary,
          size: 40,)),
          ),
          //home list tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              title: const Text("H O M E"),
              leading: const Icon(Icons.home),
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ),

          // settings list 
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              title: const Text("S E T T I N G S"),
              leading: const Icon(Icons.settings),
              onTap: (){
                Navigator.pop(context);
                //navigate to settings page
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                    )
                  );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              title: const Text("L M S"),
              leading: const Icon(Icons.book),
              onTap: (){
                Navigator.pop(context);
                //navigate to settings page
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => const LmsPage(),
                    )
                  );
              },
            ),
          ),


          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              title: const Text("A I MITRA"),
              leading: const Icon(Icons.architecture_outlined),
              onTap: (){
                Navigator.pop(context);
                //navigate to settings page
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => const AiMitra(),
                    )
                  );
              },
            ),
          ),

          //logout tile 
          
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0,bottom: 25.0),
            child: ListTile(
              title: const Text("L O G O U T"),
              leading: const Icon(Icons.logout),
              onTap: logout,
            ),
          ),
        ],
      ),
    );
  }
}