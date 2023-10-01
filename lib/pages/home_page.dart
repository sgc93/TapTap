import 'package:flutter/material.dart';
import 'package:tab_tab_game/pages/drawer_page.dart';
import 'package:tab_tab_game/pages/end_rawer_page.dart';
import 'package:tab_tab_game/widgets/app_bar.dart';
import 'package:tab_tab_game/widgets/container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late final double _height = MediaQuery.of(context).size.height;
  late final double _width = MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.grey[900],
      appBar: MyAppBar(
        height: _height * 0.10,
        width: _width,
        scaffoldKey: scaffoldKey,
      ),
      drawer: const MyDrawer(),
      endDrawer: const MyEndDrawer(),
      body: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  MyContainer(
                    height: _height * 0.350,
                    width: _width * 0.6,
                    child: const Center(
                      child: Text(
                        'LEVEL',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ), // level box
                  MyContainer(
                    height: _height * 0.350,
                    width: _width * 0.6,
                    child: const Center(
                      child: Text('DURATION',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                  ), // dutation box
                ],
              ), // duration and lebel bar
              MyContainer(
                height: _height * 0.74,
                width: _width * 0.2,
                child: const Center(
                  child: Text('SIDEBAR',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ), // side bar
            ],
          ),
          navigatorButton(), // play btn
        ],
      ),
    );
  }

  Widget navigatorButton() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/gamepage');
        print('taped');
      },
      child: MyContainer(
        height: _height * 0.1,
        width: _width,
        child: const Center(
          child: Text(
            'PLAY',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
