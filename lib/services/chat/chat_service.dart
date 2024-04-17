import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:SomaiyaChat/models/message.dart';

class ChatService {
  //get firestore instance & auth
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //get user stream

  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        //go thru each member
        final user = doc.data();

        //return user
        return user;
      }).toList();
    });
  }

  //send texts
  Future<void> sendMessage(String recieverID, message) async {
    //get user info
    final String currentUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    //new message
    Message newMessage = Message(
        senderID: currentUserID,
        senderEmail: currentUserEmail,
        recieverID: recieverID,
        message: message,
        timestamp: timestamp);

    //make chat room ID for to user should be unique
    List<String> ids=[currentUserID,recieverID];
    ids.sort();//sorts so that two people have same chatroomID
    String chatroomID= ids.join('_');
    

    //add msg to db
    await _firestore
      .collection("chat_rooms")
      .doc(chatroomID)
      .collection("messages")
      .add(newMessage.toMap());
  }

  //recieve texts
  Stream<QuerySnapshot> getMessages(String userID,otherUserID){
    //constructing chatroom ID for two users
    List<String> ids=[userID,otherUserID];
    ids.sort();
    String chatroomID=ids.join('_');
    ids=ids.reversed.toList();

    return _firestore
      .collection("chat_rooms")
      .doc(chatroomID)
      .collection("messages")
      .orderBy("timestamp", descending: true)
      .snapshots();
  }
}
