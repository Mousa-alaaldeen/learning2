// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:test1/component/styles.dart';


class BuildListTile extends StatelessWidget {
  final String subtitle;
  final String images;
  final String title;
  final Function()? url;
  final IconData icon;
  const BuildListTile({
    Key? key,
    this.url,
    required this.subtitle,
    required this.images,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(
                        images,
                      ),
                      fit: BoxFit.fill)),
              // child: Image.asset(
              //   images,
              //   width: 200,
              //   height: 200,
              //   fit: BoxFit.fill,
              // ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: Text(title, style: Styles.textStyle40),
              ),
              Text(
                subtitle,
                style: Styles.textStyle25,
              ),
            ],
          ),
          Spacer(),
          IconButton(
            icon: Icon(
              icon,
              size: 40,
            ),
            onPressed: url,
          ),
        ],
      ),
    );
  }
}
