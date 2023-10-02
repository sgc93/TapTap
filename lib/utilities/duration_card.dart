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
            color: Color.fromRGBO(241, 131, 3, 1),
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
            GestureDetector(
              onTap: () {
                setState(() {
                  if (_duration > 1) {
                    _duration--;
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
                      color: Color.fromRGBO(241, 131, 3, 1),
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
            ),
            const Text(
              'seconds',
              style: TextStyle(
                color: Color.fromRGBO(241, 131, 3, 1),
                fontSize: 16,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (_duration < 60) {
                    _duration++;
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
                      color: Color.fromRGBO(241, 131, 3, 1),
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
