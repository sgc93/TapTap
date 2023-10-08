mixin Settings {
  int level = 1;
  int duration = 20;

  void setLevel({required newLevel}) {
    level = newLevel;
  }

  void setDuration({required newDuration}) {
    duration = newDuration;
  }
}
