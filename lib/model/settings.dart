class Settings {
  int level = 1;
  int duration = 30;

  Settings({
    required this.level,
    required this.duration,
  });

  void setLevel({required newLevel}) {
    level = newLevel;
  }

  void setDuration({required newDuration}) {
    duration = newDuration;
  }
}
