import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final double _statusConstant = 10 / 71;
  final double _heightConstant = 71 / 10;

  bool _isGameStarted = false;
  bool _isGamePoused = false;

  double _gameAreaOneHeight = 355;
  double _gameAreaTwoHeight = 355;

  int _playerOneStatus = 50;
  int _playerTwoStatus = 50;

  int _playerOneNumTap = 0;
  int _playerTwoNumTap = 0;

  String? _winnerIdentity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Stack(
        children: [
          _bottomBtnContainer(),
          Stack(
            children: [
              _gameArea(),
              _sidePercentContainer(),
            ],
          )
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
    return Container(
      color: Colors.white12,
      width: 100,
      child: TextButton(
        onPressed: () {
          setState(() {
            if (!_isGameStarted) {
              _isGameStarted = true;
            }
          });
        },
        child: const Text('Start'),
      ),
    );
  }

  Widget _stopTextButton() {
    return Container(
      color: Colors.white12,
      width: 100,
      child: TextButton(
        onPressed: () {
          setState(() {
            if (_isGameStarted) {
              _isGameStarted = false;
              _isGamePoused = true;
            }
          });
        },
        child: const Text('Pouse'),
      ),
    );
  }

  Widget _restartTextButon() {
    return Container(
      color: Colors.white12,
      width: 100,
      child: TextButton(
        onPressed: () {
          setState(() {
            if (_isGameStarted || _isGamePoused) {
              _isGameStarted = true;
              _isGamePoused = false;
              _gameAreaOneHeight = 355;
              _gameAreaTwoHeight = 355;
              _updateStatus();
            }
          });
        },
        child: const Text('Restart'),
      ),
    );
  }

  Widget _bottomBtnContainer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _startTextButton(),
            _stopTextButton(),
            _restartTextButon(),
          ],
        ),
      ),
    );
  }

  Widget _sidePercentContainer() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.all(5),
        // color: Colors.white,
        height: 700,
        width: 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _statusBoxOne(),
            _statusBoxTwo(),
          ],
        ),
      ),
    );
  }

  Widget _statusBoxTwo() {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      child: Text(
        '$_playerTwoStatus%',
      ),
    );
  }

  Widget _statusBoxOne() {
    return Container(
      child: Text(
        '$_playerOneStatus%',
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
                  _gameAreaOneHeight = 355;
                  _gameAreaTwoHeight = 355;
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
                  _gameAreaOneHeight = 355;
                  _gameAreaTwoHeight = 355;
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
                  _gameAreaOneHeight = 355;
                  _gameAreaTwoHeight = 355;
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
                  _gameAreaOneHeight = 355;
                  _gameAreaTwoHeight = 355;
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

  _getBoxDecoration() {
    return BoxDecoration(
      color: Colors.grey[300],
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
    );
  }
}
