import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  // instance for auth and firestore

  final FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;


  //getting current user
  User ? getCurrentUser(){
    return _auth.currentUser;
  }

  //sign in
  Future<UserCredential> signInWithEmailPassword(String email,password) async {
    try{
      UserCredential userCredential =await _auth.signInWithEmailAndPassword(email: email, password: password,);

      //save user infor if doesnt alr exist
      _firestore.collection("Users").doc(userCredential.user!.uid).set(
          {
              'uid':userCredential.user!.uid,
              'email':email,
          },
      );

      return userCredential;
    }on FirebaseAuthException catch (e){
      throw Exception(e.code);
    }
  }

  //sign up
  Future<UserCredential>signUpWithEmailPassword(String email,password) async {
    try{
      //create user
      UserCredential userCredential=await _auth.createUserWithEmailAndPassword(email: email, password: password);

      //save user infor in a diff doc
      _firestore.collection("Users").doc(userCredential.user!.uid).set(
          {
              'uid':userCredential.user!.uid,
              'email':email,
          },
      );

      return userCredential;
    }on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }

  }

  //sign out
  Future<void>signOut() async {
    return await _auth.signOut();
  }

  //errors



}