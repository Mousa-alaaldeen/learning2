// import 'dart:io';

// import 'package:admob_flutter/admob_flutter.dart';

// class AdsManager {
//   static const bool _testMode = true;
//   static String get appIdEx {
//     if (Platform.isAndroid) {
//       return "ca-app-pub-3027891125673377~3749129625";
//     } else if (Platform.isIOS) {
//       return "";
//     } else {
//       throw UnimplementedError("Unimplemented platform");
//     }
//   }

//   static String get bannerAbUnitIdEx {
//     if (_testMode == true) {
//       return AdmobBanner.testAdUnitId;
//     } else if (Platform.isAndroid) {
//       return "ca-app-pub-3027891125673377/8415132940";
//     } else if (Platform.isIOS) {
//       return "ca-app-pub-3027891125673377/8415132940";
//     } else {
//       throw UnimplementedError("Unimplemented platform");
//     }
//   }

//   static String get nativeAbUnitIdEx {
//     if (_testMode == true) {
//       return AdmobReward.testAdUnitId;
//     } else if (Platform.isAndroid) {
//       return "ca-app-pub-3027891125673377/4036904239";
//     } else if (Platform.isIOS) {
//       return "ca-app-pub-3027891125673377/4036904239";
//     } else {
//       throw UnimplementedError("Unimplemented platform");
//     }
//   }

//   static String get interstitialAbUnitIdEx {
//     if (_testMode == true) {
//       return AdmobInterstitial.testAdUnitId;
//     } else if (Platform.isAndroid) {
//       return "ca-app-pub-3027891125673377~3749129625";
//     } else if (Platform.isIOS) {
//       return "";
//     } else {
//       throw UnimplementedError("Unimplemented platform");
//     }
//   }
// }
