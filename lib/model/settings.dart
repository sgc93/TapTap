mixin Settings {
  int level = 1;
  int duration = 10;

  final double statusConstant = 10 / 80;
  final double heightConstant = 80 / 10;

  bool isGameStarted = false;
  bool isGamePoused = false;
  bool isgameOver = false;
  bool isRestarted = false;

  double gameAreaOneHeight = 400;
  double gameAreaTwoHeight = 400;

  int playerOneStatus = 50;
  int playerTwoStatus = 50;

  int playerOneNumTap = 0;
  int playerTwoNumTap = 0;

  bool isPlayerOneWin = false;
  bool isPlayerTwoWin = false;

  void setLevel({required newLevel}) {
    level = newLevel;
  }

  void setDuration({required newDuration}) {
    duration = newDuration;
  }
}
