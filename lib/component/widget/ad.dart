// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:test1/controller.dart';

// class AdmobHome extends StatelessWidget {
//   const AdmobHome({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     AdHomeController adController = Get.put(AdHomeController());

//     return GetBuilder<AdHomeController>(builder: (_) {
//       return adController.isAdLoaded
//           ? SizedBox(
//               height: adController.bannerAd.size.height.toDouble(),
//               width: adController.bannerAd.size.width.toDouble(),
//               child: AdWidget(ad: adController.bannerAd),
//             )
//           : SizedBox();
//     });
//   }
// }
