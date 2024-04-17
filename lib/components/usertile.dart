import 'package:flutter/material.dart';


class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const UserTile({super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 25),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              //icon
              const Icon(Icons.account_circle_sharp),

              const SizedBox(width: 20),
              //username
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}