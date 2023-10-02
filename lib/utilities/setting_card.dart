import 'package:flutter/material.dart';
import 'package:tab_tab_game/widgets/container.dart';

class SettingsCard extends StatefulWidget {
  const SettingsCard({super.key});

  @override
  State<SettingsCard> createState() => _SettingsCardState();
}

class _SettingsCardState extends State<SettingsCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          child: const ListTile(
            title: MyContainer(
              height: 40,
              width: 40,
              isCircle: true,
              child: Icon(
                Icons.toggle_on,
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              'dark mode',
              style: TextStyle(
                color: Colors.white54,
              ),
            ),
          ),
        ),
        getDevider(),
        GestureDetector(
          child: const ListTile(
            title: MyContainer(
              height: 40,
              width: 40,
              isCircle: true,
              child: Icon(
                Icons.toggle_on,
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              'show state',
              style: TextStyle(
                color: Colors.white54,
              ),
            ),
          ),
        ),
        getDevider(),
        GestureDetector(
          child: const ListTile(
            title: MyContainer(
              height: 40,
              width: 40,
              isCircle: true,
              child: Icon(
                Icons.toggle_on,
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              'auto start',
              style: TextStyle(
                color: Colors.white54,
              ),
            ),
          ),
        ),
        getDevider(),
        GestureDetector(
          child: const ListTile(
            title: MyContainer(
              height: 40,
              width: 40,
              isCircle: true,
              child: Icon(
                Icons.toggle_on,
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              'save highs',
              style: TextStyle(
                color: Colors.white54,
              ),
            ),
          ),
        ),
        getDevider(),
        GestureDetector(
          child: const ListTile(
            title: MyContainer(
              height: 40,
              width: 40,
              isCircle: true,
              child: Icon(
                Icons.refresh,
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              'reset all',
              style: TextStyle(
                color: Colors.white54,
              ),
            ),
          ),
        ),
      ],
    );
  }

  getDevider() {
    return const Divider(
      color: Colors.white,
      height: 3,
    );
  }
}
