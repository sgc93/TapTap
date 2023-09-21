import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabTab'), // haya seba selasa semanyazetegn
      ),
      body: Container(
        color:const Color.fromRGBO(31, 3, 31, 1.0),
      ),
    );
  }
}