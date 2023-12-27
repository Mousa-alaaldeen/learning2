// ignore_for_file: library_private_types_in_public_api, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:test1/component/app_images.dart';
import 'package:test1/component/components.dart';
import 'package:test1/component/styles.dart';
import 'package:test1/models/storeis_model.dart';
import 'package:test1/screen/en_screen/storeis/storeis_screen.dart';


class StoreisScreen extends StatefulWidget {
  const StoreisScreen({Key? key}) : super(key: key);

  @override
  State<StoreisScreen> createState() => _StoreisScreenState();
}

class _StoreisScreenState extends State<StoreisScreen> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    int columnCount = 3;
    List<StoreisModel> stories = [
      StoreisModel(
          image: AppImages.story1,
          text:
              "Last week, Naim and Hadi went to the river nearby. They went there by bicycle. They brought their fishing rods and baits.At the river, they found a perfect spot and sat down. They put the baits and started fishing. While fishing, they chatted about school.Suddenly, Hadi caught a fish. Hadi pulled his fishing rod but the fish was strong. Naim helped Hadi. They pulled together. Finally, they managed to pull out the fish. It was very big. They laughed happily.After catching a few fish, they felt hungry. So, they stopped and ate lunch. Their mother had prepared sandwiches for them. Then, they went home. It was a great day."),
      StoreisModel(
          image: AppImages.story2,
          text:
              'A zoo is a place for animals. Children love to go to the zoo. There are so many animals in the zoo. Animals in the zoo are kept in cages. Everyone can watch animals closely. A zoo is also a safe place for animals. Monkeys and elephants are common animals in the zoo. Zoo provides food to animals.'),
      StoreisModel(
          image: AppImages.story3,
          text:
              'The butterfly is one of the beautiful creatures in the world. They taste with their feet and have a suction tube for a mouth. There are 4 stages in becoming a butterfly: egg, caterpillar, pupa, and adult. This process is called metamorphosis. An adult female lays her eggs on a plant'),
      StoreisModel(
          image: AppImages.story4,
          text:
              'This is my blue toothbrush. I use it every day. I brush my teeth three times a day. I brush them in the morning, at noon and before bedtime. My mother taught me how to brush my teeth. I want to have clean and healthy teeth and gums. Thanks to my toothbrush!'),
      StoreisModel(
          image: AppImages.story5,
          text:
              'A best friend is a person who you value above other friends in your life, someone you have fun with, someone you trust and someone in whom you confide. The first person you call when you get good news or want to go out for a bite to eat is an example of your best friend.'),
      StoreisModel(
          image: AppImages.story6,
          text:
              "I like reading so much. It's my favorite hobby.There is no better companion than a good book. I depend on reading to develop my language skills and vocabulary. Reading is a good way to relax and reduce stress. I usually go to the Public Library in my town. My friend Jemmy always comes with me. I like reading about nature and animals.Jemmy likes reading about sports."),
      StoreisModel(
          image: AppImages.story7,
          text:
              "I love my father. He is very kind. He is called Robert. He's 45 years old. He is an active person. He gets up early to get ready for his work. He is an architect. He always designs high skyscrapers."),
      StoreisModel(
          image: AppImages.story8,
          text:
              "My sister is Sarah. She is pretty and kind. She likes to play with dolls. She likes to go shopping with mom and dad. Her favorite food is salad."),
      StoreisModel(
          image: AppImages.story9,
          text:
              "Ted is my baby brother. He always tinkers with his toy train. One day he got lost. We found him in a tent."),
      StoreisModel(
          image: AppImages.story10,
          text:
              "Dan is my daddy. He is a doctor. He drinks a lot of juice. He also loves to dance. Dad is very dear to us."),
      StoreisModel(
        image: AppImages.story11,
        text:
            "I am Mark. My younger brother is Mike. I am nine years old. He is seven. We like to play soccer. We go to the park together. We enjoy biking. We like flying kites. We enjoy our time playing with other kids. We love each other very much.",
      ),
      StoreisModel(
        image: AppImages.story12,
        text:
            "Today is my little sister's birthday. We have a party this evening. My mother is busy baking a chocolate cake. My father is wrapping a birthday gift for my little sister. I am so excited to celebrate her birthday with the whole family.",
      ),
    ];
    return Scaffold(
      appBar: AppBar(
          backgroundColor: colors3,
          title: const Text(
            'قصص باللغه الانجليزيه',
            style: Styles.textStyle25,
          ),
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle.light),
      body: AnimationLimiter(
        child: GridView.count(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          padding: EdgeInsets.all(w / 60),
          crossAxisCount: columnCount,
          children: List.generate(
            stories.length,
            (int index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 500),
                columnCount: columnCount,
                child: ScaleAnimation(
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: FadeInAnimation(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StoriesScreen(
                              image: stories[index].image,
                              title: stories[index].text,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            bottom: w / 30, left: w / 60, right: w / 60),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                stories[index].image,
                              ),
                              fit: BoxFit.fill),
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 40,
                              spreadRadius: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
