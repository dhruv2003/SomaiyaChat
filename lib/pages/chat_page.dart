import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:SomaiyaChat/components/chat_bubble.dart";
import "package:SomaiyaChat/components/textfield.dart";
import "package:SomaiyaChat/services/auth/auth_service.dart";
import "package:SomaiyaChat/services/chat/chat_service.dart";

class ChatPage extends StatefulWidget {
  final String recieverEmail;
  final String recieverID;

  ChatPage({super.key, required this.recieverEmail, required this.recieverID});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  //text controller
  final TextEditingController _messageController = TextEditingController();

  //chat and auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();


  //to focus TextNode
  FocusNode myFocusNode =FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //adding listener to focus node
    myFocusNode.addListener(() { 
      if(myFocusNode.hasFocus) {
        //cause delay
        //calc remaining space
        //scroll

        Future.delayed(
          const Duration(milliseconds: 500),
          () => scrollDown(),
        );
      }
    });
    //wait a bit to build listview then scroll to bottom
    Future.delayed(const Duration(microseconds:500 ),() => scrollDown(),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    myFocusNode.dispose();
    _messageController.dispose();
    super.dispose();
  }


  //scroll controller
  final  ScrollController _scrollcontroller = ScrollController();
  void  scrollDown(){
    _scrollcontroller.animateTo(
    _scrollcontroller.position.maxScrollExtent,
    duration: const Duration(seconds: 1),
    curve: Curves.fastOutSlowIn,
    );
  }

  //send texts
  void sendMessage() async {
    //if something in textfield
    if (_messageController.text.isNotEmpty) {
      //send msg
      await _chatService.sendMessage(widget.recieverID, _messageController.text);

      //clr text controllers
      _messageController.clear();
    }
    // scrollDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text(widget.recieverEmail),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.red,
        elevation: 0,
      ),
      body: Column(
        children: [
          //display texts
          Expanded(
            child: _buildMessageList(),
          ),
          //user msg
          _buildUserInput(),
        ],
      ),
    );
  }

  //build Message List
  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessages(widget.recieverID, senderID),
      builder: (context, snapshot) {
        //erros
        if (snapshot.hasError) {
          return const Text("Error");
        }

        //loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading..");
        }

        //return list view
        return ListView(
          controller: _scrollcontroller,
          reverse: true, //added so that proper view of chat 
          children:
              snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
              
        );
      },
    );
  }

  //msg item
  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    //if current user
    bool isCurrentUser = data['senderID'] == _authService.getCurrentUser()!.uid;

    //align msgs acc to sender,reciever
    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment: 
        isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          ChatBubble(message: data["message"],isCurrentUser: isCurrentUser,)
        ],
      ));
  }

  //build input
  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Row(
        children: [
          //textfield
          Expanded(
            child: MyTextField(
              controller: _messageController,
              hintText: "Type Your Message",
              obscureText: false,
              focusNode: myFocusNode,
            ),
          ),
      
          //send btn
          Container(
            decoration: const BoxDecoration(color: Colors.redAccent,
            shape: BoxShape.circle),
            margin: const EdgeInsets.only(right: 25),
            child: IconButton(
              onPressed: sendMessage,
              icon: const Icon(Icons.arrow_upward,
              color: Colors.white,),
            ),
          ),
        ],
      ),
    );
  }
}
