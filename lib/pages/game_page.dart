import 'package:flutter/material.dart';
import 'package:tab_tab_game/widgets/container.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final double _statusConstant = 10 / 80;
  final double _heightConstant = 80 / 10;

  bool _isGameStarted = false;
  bool _isGamePoused = false;

  double _gameAreaOneHeight = 400;
  double _gameAreaTwoHeight = 400;

  int _playerOneStatus = 50;
  int _playerTwoStatus = 50;

  int _playerOneNumTap = 0;
  int _playerTwoNumTap = 0;

  String? _winnerIdentity;

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
          if (_isGameStarted) {
            _playerOneNumTap++;
            _gameAreaTwoHeight -= _heightConstant * 4;
            _gameAreaOneHeight += _heightConstant * 4;
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
        height: _gameAreaOneHeight,
      ),
    );
  }

  Widget _gameAreaTwo() {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_isGameStarted) {
            _playerTwoNumTap++;
            _gameAreaOneHeight -= _heightConstant * 4;
            _gameAreaTwoHeight += _heightConstant * 4;
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
        height: _gameAreaTwoHeight,
      ),
    );
  }

  Widget _startTextButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          if (!_isGameStarted) {
            _isGameStarted = true;
          }
        });
      },
      child: const Text('Start'),
    );
  }

  Widget _stopTextButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          if (_isGameStarted) {
            _isGameStarted = false;
            _isGamePoused = true;
          }
        });
      },
      child: const Text('Pouse'),
    );
  }

  Widget _restartTextButon() {
    return TextButton(
      onPressed: () {
        setState(() {
          if (_isGameStarted || _isGamePoused) {
            _isGameStarted = true;
            _isGamePoused = false;
            _gameAreaOneHeight = 400;
            _gameAreaTwoHeight = 400;
            _updateStatus();
          }
        });
      },
      child: const Text('Restart'),
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
        '$_playerTwoStatus%',
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
        '$_playerOneStatus%',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void _updateStatus() {
    _playerOneStatus = (_statusConstant * _gameAreaOneHeight).round();
    _playerTwoStatus = 100 - _playerOneStatus;
  }

  void _checkWin() {
    if (_playerOneStatus == 98 || _playerTwoStatus == 98) {
      if (_playerOneStatus == 98) {
        _winnerIdentity = 'amber';
      } else {
        _updateStatus();
        _winnerIdentity = 'cyan';
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
          backgroundColor: Colors.white,
          elevation: 8,
          title: const Text('Game Over!'),
          content: SingleChildScrollView(
            child: Text('🎉🥇Player $_winnerIdentity win!🏆🏆🏆'),
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
                  _isGameStarted = true;
                  _gameAreaOneHeight = 400;
                  _gameAreaTwoHeight = 400;
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
                  _isGameStarted = false;
                  _gameAreaOneHeight = 400;
                  _gameAreaTwoHeight = 400;
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
          backgroundColor: Colors.white,
          elevation: 8,
          title: const Text('Game Status Detail'),
          content: SingleChildScrollView(
            child: _showGameDetail(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _isGameStarted = true;
                  _gameAreaOneHeight = 400;
                  _gameAreaTwoHeight = 400;
                  _updateStatus();
                  Navigator.pop(context);
                });
              },
              child: const Icon(Icons.restart_alt),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _isGameStarted = false;
                  _gameAreaOneHeight = 400;
                  _gameAreaTwoHeight = 400;
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
                color: Colors.amber,
                child: const Center(child: Text('Player 1')),
              ),
              Column(
                children: [
                  Text('👉🏼 $_playerOneNumTap taps'),
                  Text('👉🏼 $_playerOneNumTap taps'),
                  Text('👉🏼 $_playerOneNumTap taps'),
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
                color: Colors.cyan,
                child: const Center(child: Text('Player 2')),
              ),
              Column(
                children: [
                  Text('👉🏼 $_playerTwoNumTap taps'),
                  Text('👉🏼 $_playerTwoNumTap taps'),
                  Text('👉🏼 $_playerTwoNumTap taps'),
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
      child: const Text('Menu'),
    );
  }
}
