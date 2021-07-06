class AnimationDurations {
  // PLAY - PAUSE ICON
  static const Duration videoPlayAndPauseAnimationDuration = const Duration(milliseconds: 180);
  static const Duration videoPlayAndPauseIconAnimationDuration = const Duration(milliseconds: 125);

  // MAIN SCREEN SWITCH
  static const Duration mainScreenSwitchAnimationDuration = const Duration(milliseconds: 280);
  static Duration halfScreenSwitchAnimationDuration =
      Duration(milliseconds: mainScreenSwitchAnimationDuration.inMilliseconds ~/ 2);
}
