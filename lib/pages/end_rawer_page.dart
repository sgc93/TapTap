import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: const Text(
        'END-DRAWER',
        style: TextStyle(
          fontSize: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
