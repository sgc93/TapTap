import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              child: _startTextButton(),
              alignment: Alignment.center,
            )
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

  Widget _startTextButton() {
    return TextButton(
      onPressed: (){},
      child: const Text('start'),
    );
  }

  Widget _gameAreaOne(){
    return GestureDetector(
      onTap: () {
        setState(() {
          _gameAreaTwoHeight -= 10;
          _gameAreaOneHeight += 10;
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
          _gameAreaOneHeight -= 10;
          _gameAreaTwoHeight += 10;
        });
      },
      child: Container(
        height: _gameAreaTwoHeight,
        color: Colors.cyan,
      ),
    );
  }
}