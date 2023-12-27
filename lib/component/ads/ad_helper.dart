class AdHelper {
  static const bool _testMode = true;

  static String get bannerAdUnitId {
    if (_testMode) {
      return 'ca-app-pub-3940256099942544/6300978111';
    }

    return 'ca-app-pub-3027891125673377/7694508835';
  }

  static String get viewAd {
    if (_testMode) {
      return "ca-app-pub-3940256099942544/6300978111";
    }

    return 'ca-app-pub-8887736687313297/8397237562';
  }

  static String get interstitialAdUnitId {
    if (_testMode) {
      return 'ca-app-pub-3940256099942544/1033173712';
    }

    return 'ca-app-pub-3027891125673377/5229704005';
  }
}
