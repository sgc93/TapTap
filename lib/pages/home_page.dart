import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double _statusConstant = (10/71);

  bool _isGameStarted = false;
  bool _isGamePoused = false;

  double _gameAreaOneHeight = 355;
  double _gameAreaTwoHeight = 355;

  int _playerOneStatus = 50;
  int _playerTwoStatus = 50;

  @override
  Widget build(BuildContext context) {
    double _deviceWidth = MediaQuery.of(context).size.width;

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
            _gameAreaTwoHeight -= 10;
            _gameAreaOneHeight += 10;
            _updateStatus();
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
            _gameAreaOneHeight -= 10;
            _gameAreaTwoHeight += 10;
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
}