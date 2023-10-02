import 'package:flutter/material.dart';
import 'package:tab_tab_game/widgets/container.dart';

class LevelCard extends StatefulWidget {
  const LevelCard({super.key});

  @override
  State<LevelCard> createState() => _LevelCardState();
}

class _LevelCardState extends State<LevelCard> {
  int _level = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'LEVEL',
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.left,
        ),
        Text(
          '$_level',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 100,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyContainer(
              height: 60,
              width: 60,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (_level > 1) {
                      _level--;
                    }
                  });
                },
                child: const Center(
                  child: Text(
                    '-',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
            ),
            MyContainer(
              height: 60,
              width: 60,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (_level < 4) {
                      _level++;
                    }
                  });
                },
                child: const Center(
                  child: Text(
                    '+',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
