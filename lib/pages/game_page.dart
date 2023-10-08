import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tab_tab_game/model/settings.dart';
import 'package:tab_tab_game/widgets/container.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> with Settings {
  @override
  void initState() {
    super.initState();
  }

  _countingDown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (duration > 0) {
        setState(() {
          duration--;
        });
      } else if (duration == 0) {
        setState(() {
          isGameStarted = false;
          isgameOver = true;
          duration = 20;
        });
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          Stack(
            children: [
              _gameArea(),
              _sidePercentContainer(),
            ],
          ),
          MyContainer(
            height: 31,
            width: 500,
            isCircle: false,
            child: _bottomBtnContainer(),
          ),
        ],
      ),
    );
  }

  Widget _gameArea() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            _gameAreaOne(),
            _gameAreaTwo(),
          ]),
    );
  }

  Widget _gameAreaOne() {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isGameStarted) {
            playerOneNumTap++;
            gameAreaTwoHeight -= heightConstant * 4;
            gameAreaOneHeight += heightConstant * 4;
            _updateStatus();
            _checkWin();
          }
        });
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(3, 169, 241, 1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        height: gameAreaOneHeight,
      ),
    );
  }

  Widget _gameAreaTwo() {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isGameStarted) {
            playerTwoNumTap++;
            gameAreaOneHeight -= heightConstant * 4;
            gameAreaTwoHeight += heightConstant * 4;
            _updateStatus();
            _checkWin();
          }
        });
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(241, 131, 3, 1),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        height: gameAreaTwoHeight,
      ),
    );
  }

  Widget _startTextButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          if (!isGameStarted) {
            isGameStarted = true;
            _countingDown();
          }
        });
      },
      child: _getText('START'),
    );
  }

  Widget _stopTextButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          if (isGameStarted) {
            isGameStarted = false;
            isGamePoused = true;
          }
        });
      },
      child: _getText('POUSE'),
    );
  }

  Widget _restartTextButon() {
    return TextButton(
      onPressed: () {
        setState(() {
          if (isGameStarted || isGamePoused) {
            isGameStarted = true;
            isGamePoused = false;
            gameAreaOneHeight = 400;
            gameAreaTwoHeight = 400;
            _updateStatus();
          }
        });
      },
      child: _getText('RESTART'),
    );
  }

  Widget _getText(text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white70,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _bottomBtnContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _startTextButton(),
        _stopTextButton(),
        _restartTextButon(),
        _goToMenuButon(),
      ],
    );
  }

  Widget _sidePercentContainer() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(top: 40),
        height: 740,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _statusBoxOne(),
            _durationStatus(),
            _statusBoxTwo(),
          ],
        ),
      ),
    );
  }

  Widget _statusBoxTwo() {
    return _statusContainer(
      const Color.fromRGBO(241, 131, 3, 1),
      Text(
        '$playerTwoStatus%',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _durationStatus() {
    return _statusContainer(
      Colors.grey[900],
      Text(
        '$duration',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _statusBoxOne() {
    return _statusContainer(
      const Color.fromRGBO(3, 169, 241, 1),
      Text(
        '$playerOneStatus%',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void _updateStatus() {
    playerOneStatus = (statusConstant * gameAreaOneHeight).round();
    playerTwoStatus = 100 - playerOneStatus;
  }

  void _checkWin() {
    if (playerOneStatus == 98 || playerTwoStatus == 98) {
      if (playerOneStatus == 98) {
        isPlayerOneWin = true;
        isPlayerTwoWin = false;
      } else {
        _updateStatus();
        isPlayerTwoWin = true;
        isPlayerOneWin = false;
      }
      _showWinnerDialog(context);
    } else {
      print('Playing ... ');
    }
  }

  void _showWinnerDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          elevation: 8,
          title: Text(
            'Game Over!',
            style: TextStyle(
              color: isPlayerOneWin
                  ? const Color.fromRGBO(3, 169, 241, 1)
                  : const Color.fromRGBO(241, 131, 3, 1),
            ),
          ),
          content: SingleChildScrollView(
            child: Text(
              isPlayerOneWin
                  ? '🎉🥇Player One win!🏆🏆🏆'
                  : '🎉🥇Player Two win!🏆🏆🏆',
              style: TextStyle(
                color: isPlayerOneWin
                    ? const Color.fromRGBO(3, 169, 241, 0.7)
                    : const Color.fromRGBO(241, 131, 3, 0.7),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                  _showGameDetailDialog(context);
                });
              },
              child: const Text('Detail'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  isGameStarted = true;
                  gameAreaOneHeight = 400;
                  gameAreaTwoHeight = 400;
                  _updateStatus();
                  Navigator.pop(context);
                });
              },
              child: const Icon(
                Icons.restart_alt,
                size: 20,
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  isGameStarted = false;
                  gameAreaOneHeight = 400;
                  gameAreaTwoHeight = 400;
                  _updateStatus();
                  Navigator.pop(context);
                });
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  void _showGameDetailDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          elevation: 8,
          title: const Text(
            'Game Status Detail',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          content: SingleChildScrollView(
            child: _showGameDetail(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  isGameStarted = true;
                  gameAreaOneHeight = 400;
                  gameAreaTwoHeight = 400;
                  _updateStatus();
                  Navigator.pop(context);
                });
              },
              child: const Icon(Icons.restart_alt),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  isGameStarted = false;
                  gameAreaOneHeight = 400;
                  gameAreaTwoHeight = 400;
                  _updateStatus();
                  Navigator.pop(context);
                });
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  Widget _showGameDetail() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                height: 50,
                color: const Color.fromRGBO(3, 169, 241, 0.7),
                child: const Center(
                  child: Text(
                    'Player 1',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Text('👉🏼 playerOneNumTap taps'),
                  Text('👉🏼 playerOneNumTap taps'),
                  Text('👉🏼 playerOneNumTap taps'),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                height: 50,
                color: const Color.fromRGBO(241, 131, 3, 0.7),
                child: const Center(
                  child: Text(
                    'Player 2',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Text('👉🏼 $playerTwoNumTap taps'),
                  Text('👉🏼 $playerTwoNumTap taps'),
                  Text('👉🏼 $playerTwoNumTap taps'),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _statusContainer(color, child) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade600,
            offset: const Offset(5, 5),
            blurRadius: 8,
          ),
          const BoxShadow(
            color: Colors.white,
            offset: Offset(-5, -5),
            blurRadius: 8,
          ),
        ],
      ),
      child: Center(
        child: child,
      ),
    );
  }

  Widget _goToMenuButon() {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: _getText('MENU'),
    );
  }
}
