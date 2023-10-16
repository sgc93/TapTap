import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tab_tab_game/model/setting_model.dart';
import 'package:tab_tab_game/widgets/container.dart';

class LevelCard extends StatefulWidget {
  const LevelCard({super.key});

  @override
  State<LevelCard> createState() => _LevelCardState();
}

class _LevelCardState extends State<LevelCard> {
  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<Settings>(context);

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
          settings.level.toString(),
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
                  if (settings.level > 1) {
                    settings.decreaseLevel();
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
                  if (settings.level < 4) {
                    settings.increaseLevel();
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
