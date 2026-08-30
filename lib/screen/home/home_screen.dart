import 'package:flutter/material.dart';
import 'package:test1/screen/home/body.dart';

class HomeScreen extends StatelessWidget {
const HomeScreen({super.key});

@override
Widget build(BuildContext context) {
return const Scaffold(
body: SafeArea(
child: BodyScreen(),
),
);
}
}
