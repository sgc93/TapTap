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
            color: Color.fromRGBO(3, 169, 241, 1),
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
            GestureDetector(
              onTap: () {
                setState(() {
                  if (_level > 1) {
                    _level--;
                  }
                });
              },
              child: const MyContainer(
                height: 60,
                width: 60,
                isCircle: false,
                child: Center(
                  child: Text(
                    '-',
                    style: TextStyle(
                      color: Color.fromRGBO(3, 169, 241, 1),
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (_level < 4) {
                    _level++;
                  }
                });
              },
              child: const MyContainer(
                height: 60,
                width: 60,
                isCircle: false,
                child: Center(
                  child: Text(
                    '+',
                    style: TextStyle(
                      color: Color.fromRGBO(3, 169, 241, 1),
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
