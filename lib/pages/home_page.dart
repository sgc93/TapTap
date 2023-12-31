import 'package:flutter/material.dart';
import 'package:tab_tab_game/pages/drawer_page.dart';
import 'package:tab_tab_game/pages/end_rawer_page.dart';
import 'package:tab_tab_game/utilities/duration_card.dart';
import 'package:tab_tab_game/utilities/level_card.dart';
import 'package:tab_tab_game/utilities/setting_card.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    MyContainer(
                      height: _height * 0.36,
                      width: _width * 0.6,
                      isCircle: false,
                      child: const LevelCard(),
                    ),
                    MyContainer(
                      height: _height * 0.36,
                      width: _width * 0.6,
                      isCircle: false,
                      child: const DurationCard(),
                    ), // dutation box
                  ],
                ),
                MyContainer(
                  height: _height * 0.75,
                  width: _width * 0.25,
                  isCircle: false,
                  child: const SettingsCard(),
                ),
              ],
            ),
            navigatorButton(),
          ],
        ),
      ),
    );
  }

  Widget navigatorButton() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/gamepage');
      },
      child: MyContainer(
        height: _height * 0.07,
        width: _width,
        isCircle: false,
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
