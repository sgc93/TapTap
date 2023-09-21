import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isGameStarted = false;
  bool _isGamePoused = false;

  double _gameAreaOneHeight = 350;
  double _gameAreaTwoHeight = 350;

  @override
  Widget build(BuildContext context) {
    double _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('TabTab'), // haya seba selasa semanyazetegn
      ),
      body: Container(
        color:const Color.fromRGBO(31, 3, 31, 1.0),
        child: Stack(
          children: [
            _gameArea(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
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
            ),
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
    return TextButton(
      onPressed: (){
        setState(() {
          if(!_isGameStarted){
            _isGameStarted = true;
          }
        });
      },
      child: const Text('Start'),
    );
  }

  Widget _stopTextButton() {
    return TextButton(
      onPressed: (){
        setState(() {
          if(_isGameStarted){
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
      onPressed: (){
        setState(() {
          if(_isGameStarted || _isGamePoused){
            _isGamePoused = false;
            _gameAreaOneHeight = 350;
            _gameAreaTwoHeight = 350;
          }
        });
      },
      child: const Text('Restart'),
    );
  }
}