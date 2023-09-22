import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double _statusConstant = 10/71;
  final double _heightConstant = 71/10;

  bool _isGameStarted = false;
  bool _isGamePoused = false;

  double _gameAreaOneHeight = 355;
  double _gameAreaTwoHeight = 355;

  int _playerOneStatus = 50;
  int _playerTwoStatus = 50;

  String? _winnerIdentity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TapTap'), // haya seba selasa semanyazetegn
      ),
      body: Container(
        color:const Color.fromRGBO(31, 31, 31, 1.0),
        child: Stack(
          children: [
            _gameArea(),
            _bottomBtnContainer(),
            _sidePercentContainer(),
          ],
        ),
      ),
    );
  }
  
  Widget _gameArea() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          _gameAreaOne(),
          _gameAreaTwo(),
        ]
      ),
    );
  }

  Widget _gameAreaOne(){
    return GestureDetector(
      onTap: () {
        setState(() {
          if(_isGameStarted){
            _gameAreaTwoHeight -= _heightConstant * 4;
            _gameAreaOneHeight += _heightConstant * 4;
            _updateStatus();
            _checkWin();
          }
        });
      },
      child: Container(
        height: _gameAreaOneHeight,
        color: Colors.amber,
      ),
    );
  }

  Widget _gameAreaTwo(){
    return GestureDetector(
      onTap: () {
        setState(() {
          if(_isGameStarted){
            _gameAreaOneHeight -= _heightConstant * 4;
            _gameAreaTwoHeight += _heightConstant * 4;
            _updateStatus();
            _checkWin();
          }
        });
      },
      child: Container(
        height: _gameAreaTwoHeight,
        color: Colors.cyan,
      ),
    );
  }

  Widget _startTextButton() {
    return Container(
      color: Colors.white12,
      width: 100,
      child: TextButton(
        onPressed: (){
          setState(() {
            if(!_isGameStarted){
              _isGameStarted = true;
            }
          });
        },
        child: const Text('Start'),
      )
    );
  }

  Widget _stopTextButton() {
    return Container(
      color: Colors.white12,
      width: 100,
      child: TextButton(
        onPressed: (){
          setState(() {
            if(_isGameStarted){
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
        onPressed: (){
          setState(() {
            if(_isGameStarted || _isGamePoused){
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
        margin: const EdgeInsets.only(right: 10),
        color: Colors.white,
        height: 450,
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
    if(_playerOneStatus == 98 || _playerTwoStatus == 98){
      if(_playerOneStatus == 98){
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
              onPressed: (){
                setState(() {
                  Navigator.pop(context);
                  _showGameDetailDialog(context);
                });
              },
              child: const Text('Detail'),
            ),
            TextButton(
              onPressed: (){
                setState(() {
                  _isGameStarted = true;
                  _gameAreaOneHeight = 355;
                  _gameAreaTwoHeight = 355;
                  Navigator.pop(context);
                });
              },
              child: const Icon(
                Icons.restart_alt,
                size: 20,
              ),
            ),
            TextButton(
              onPressed: (){
                setState(() {
                  _isGameStarted = false;
                  _gameAreaOneHeight = 355;
                  _gameAreaTwoHeight = 355;
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
          content: const SingleChildScrollView(
            child: Text('Game Detail Status')
          ),
          actions: [
            TextButton(
              onPressed: (){
                setState(() {
                  _isGameStarted = true;
                  _gameAreaOneHeight = 355;
                  _gameAreaTwoHeight = 355;
                  Navigator.pop(context);
                });
              }, 
              child: const Icon(Icons.restart_alt),
            ),
            TextButton(
              onPressed: (){
                setState(() {
                  _isGameStarted = false;
                  _gameAreaOneHeight = 355;
                  _gameAreaTwoHeight = 355;
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
}