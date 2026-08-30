import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:test1/component/cache_helper.dart';
import 'package:test1/component/components.dart';
import 'package:test1/screen/splach/splash_screen.dart';

import 'generated/l10n.dart';

Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();

await _initializeAds();
await CacheHelper.init();
_loadSavedData();

runApp(const MyApp());
}

Future<void> _initializeAds() async {
await MobileAds.instance.initialize();

await MobileAds.instance.updateRequestConfiguration(
RequestConfiguration(
tagForChildDirectedTreatment: TagForChildDirectedTreatment.yes,
maxAdContentRating: MaxAdContentRating.g,
),
);
}

void _loadSavedData() {
idAr = CacheHelper.getData(key: 'idAr') ?? 0;
idEn = CacheHelper.getData(key: 'idEn') ?? 0;
}

class MyApp extends StatelessWidget {
const MyApp({super.key});

@override
Widget build(BuildContext context) {
return GetMaterialApp(
debugShowCheckedModeBanner: false,
locale: const Locale('ar'),
localizationsDelegates: const [
S.delegate,
GlobalMaterialLocalizations.delegate,
GlobalWidgetsLocalizations.delegate,
GlobalCupertinoLocalizations.delegate,
],
supportedLocales: S.delegate.supportedLocales,
theme: ThemeData(
useMaterial3: true,
colorScheme: ColorScheme.fromSeed(
seedColor: const Color(0xFF2F5D7E),
),
),
home: const SplashScreen(),
);
}
}
