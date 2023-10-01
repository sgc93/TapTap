import 'package:flutter/material.dart';
import 'package:tab_tab_game/widgets/container.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final double width;

  const MyAppBar({super.key, required this.height, required this.width});

  @override
  Size get preferredSize => Size(width, height);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          MyContainer(
            height: height * 0.5,
            width: height * 0.5,
            child: Icon(Icons.back_hand),
          ),
        ],
      ),
    );
  }
}
