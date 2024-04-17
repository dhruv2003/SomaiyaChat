import 'package:SomaiyaChat/consts/consts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:provider/provider.dart';
import 'package:SomaiyaChat/services/auth/auth_gate.dart';
import 'package:SomaiyaChat/config/firebase_options.dart';
import 'package:SomaiyaChat/themes/theme_provider.dart';



void main() async{
  Gemini.init(apiKey: GEMINI_API_KEY); //initialize api key
  // final Gemini gemini = Gemini.instance;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    )
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}