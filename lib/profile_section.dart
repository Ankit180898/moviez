import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        /// Text widget for user's name
        Text(
          "Ankit Kumar",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        SizedBox(
          width: 20,
        ),

        /// Circular profile thumbnail
        CircleAvatar(
          backgroundImage: AssetImage("assets/mine.jpg"),
          radius: 35,
        ),
      
        SizedBox(
          width: 30,
        ),
      ],
    );
  }
}
