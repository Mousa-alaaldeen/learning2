// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:test1/component/cache_helper.dart';
import 'package:test1/component/components.dart';
import 'package:test1/screen/splach/splash_screen.dart';

import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize AdMob
  await MobileAds.instance.initialize();

  // Set the tag for child-directed treatment
  RequestConfiguration configuration = RequestConfiguration(
    tagForChildDirectedTreatment: TagForChildDirectedTreatment.yes,
    maxAdContentRating: MaxAdContentRating.g,
  );
  MobileAds.instance.updateRequestConfiguration(configuration);

  // Initialize CacheHelper
  await CacheHelper.init();

  if (CacheHelper.getData(key: 'idAr') != null) {
    idAr = CacheHelper.getData(key: 'idAr');
  }
  if (CacheHelper.getData(key: 'idEn') != null) {
    idEn = CacheHelper.getData(key: 'idEn');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale('ar'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF2F5D7E),
        ),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
