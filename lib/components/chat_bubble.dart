
import "package:flutter/material.dart";

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  const ChatBubble({super.key,
    required this.isCurrentUser,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      color:isCurrentUser? Colors.red.shade800 : Colors.red.shade200,
      borderRadius: BorderRadius.circular(10)
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 25),
      child: Text(
        message,
        style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 1.2),
      ),
    );
  }
}

