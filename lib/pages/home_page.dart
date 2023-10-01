import 'package:flutter/material.dart';
import 'package:tab_tab_game/widgets/app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final double _height = MediaQuery.of(context).size.height;
  late final double _width = MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        height: _height * 0.10,
        width: _width,
      ),
      backgroundColor: Colors.grey[900],
    );
  }
}
