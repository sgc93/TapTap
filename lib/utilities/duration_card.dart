import 'package:flutter/material.dart';
import 'package:tab_tab_game/widgets/container.dart';

class DurationCard extends StatefulWidget {
  const DurationCard({super.key});

  @override
  State<DurationCard> createState() => _DurationCardState();
}

class _DurationCardState extends State<DurationCard> {
  int _duration = 7;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'DURATION',
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.left,
        ),
        Text(
          '$_duration',
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
                    if (_duration > 2) {
                      _duration--;
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
                    if (_duration < 60) {
                      _duration++;
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
