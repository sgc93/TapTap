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
    return SizedBox(
      height: height,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyContainer(
            height: height * 0.7,
            width: height * 0.7,
            child: drawerDisplayerButton(),
          ),
          titleColumn(),
          MyContainer(
            height: height * 0.7,
            width: height * 0.7,
            child: endDrawerDisplayerButton(),
          ),
        ],
      ),
    );
  }

  Widget titleColumn() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'TapTap',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        Text(
          'tap more to win',
          style: TextStyle(
            color: Colors.white38,
          ),
        ),
      ],
    );
  }

  Widget drawerDisplayerButton() {
    return GestureDetector(
      onTap: () {},
      child: const Icon(
        Icons.menu,
        color: Colors.white,
      ),
    );
  }

  Widget endDrawerDisplayerButton() {
    return GestureDetector(
      onTap: () {},
      child: const Icon(
        Icons.abc,
        color: Colors.white,
      ),
    );
  }
}
