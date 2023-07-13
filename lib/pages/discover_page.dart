import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:twitch_clone/data/datas.dart';

import 'package:twitch_clone/theme/colors.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Discover",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: white),
          ),
          SizedBox(
            height: 15,
          ),
          getSliderLists(),
          SizedBox(
            height: 25,
          ),
          getSectionTwo(),
          SizedBox(
            height: 25,
          ),
          getSectionThree(),
          SizedBox(
            height: 25,
          ),
          getSectionFour(),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }

  Widget getSliderLists() {
    var size = MediaQuery.of(context).size;
    return CarouselSlider(
      items: List.generate(discover_data_one.length, (index) {
        List tags = discover_data_one[index]['tags'];
        return Column(
          children: [
            getSliderImages(discover_data_one[index]),
            Expanded(
              child: Container(
                width: size.width,
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            discover_data_one[index]['name'],
                            style: TextStyle(
                                color: white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            discover_data_one[index]['type'],
                            style: TextStyle(
                                fontSize: 16, color: white.withOpacity(0.7)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: List.generate(tags.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, top: 2, bottom: 2),
                                child: Text(
                                  tags[index],
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: white.withOpacity(0.7)),
                                ),
                              ),
                            ),
                          );
                        }),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      }),
      options: CarouselOptions(height: 240),
    );
  }

  Widget getSliderImages(item) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 180,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: 180,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(item['img_video']), fit: BoxFit.cover),
            ),
          ),
          Container(
            width: size.width,
            height: 180,
            decoration: BoxDecoration(
              color: black.withOpacity(0.2),
            ),
          ),
          SizedBox(
            width: size.width,
            height: 180,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(4)),
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        "LIVE",
                        style: TextStyle(
                            color: white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(4)),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        "${item['viewers']} viewers",
                        style: const TextStyle(color: white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getSectionTwo() {
    var size = MediaQuery.of(context).size;
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(discover_icons.length, (index) {
        return Container(
          width: (size.width - 32) / 2,
          height: 40,
          decoration: BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  discover_icons[index]['label'],
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold, color: white),
                ),
                Icon(
                  discover_icons[index]['icon'],
                  color: white,
                  size: 20,
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget getSectionThree() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Live channels we think you'll like",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: white),
        ),
        const SizedBox(
          height: 15,
        ),
        getSectionThreeLists()
      ],
    );
  }

  Widget getSectionThreeLists() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(discover_data_three.length, (index) {
          List tags = discover_data_three[index]['tags'];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width * 0.7,
                height: 150,
                margin: const EdgeInsets.only(right: 10),
                decoration: const BoxDecoration(color: primary),
                child: Stack(
                  children: [
                    Container(
                      width: size.width,
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                discover_data_three[index]['img_video']),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      width: size.width,
                      height: 150,
                      decoration: BoxDecoration(color: black.withOpacity(0.2)),
                    ),
                    SizedBox(
                      width: size.width,
                      height: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(4)),
                              child: const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text(
                                  "LIVE",
                                  style: TextStyle(
                                      color: white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(4)),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  "${discover_data_three[index]['viewers']} viewers",
                                  style: const TextStyle(color: white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      discover_data_three[index]['img_profile'],
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        discover_data_three[index]['name'],
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: white),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      SizedBox(
                        width: 200,
                        child: Text(
                          discover_data_three[index]['title'],
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 15,
                            overflow: TextOverflow.clip,
                            color: white.withOpacity(0.5),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        discover_data_three[index]['type'],
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 15,
                          overflow: TextOverflow.clip,
                          color: white.withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: List.generate(tags.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                color: white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, top: 2, bottom: 2),
                                child: Text(
                                  tags[index],
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: white.withOpacity(0.7),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Icon(
                    Entypo.dots_three_vertical,
                    color: white.withOpacity(0.5),
                    size: 20,
                  )
                ],
              )
            ],
          );
        }),
      ),
    );
  }

  Widget getSectionFour() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Categories we think you'll like",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: white),
        ),
        const SizedBox(
          height: 15,
        ),
        getSectionFourLists()
      ],
    );
  }

  Widget getSectionFourLists() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(discover_data_four.length, (index) {
          List tags = discover_data_four[index]['tags'];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                width: size.width / 3,
                height: 180,
                decoration: BoxDecoration(
                    color: primary,
                    image: DecorationImage(
                        image: NetworkImage(
                            discover_data_four[index]['img_video']),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                discover_data_four[index]['name'],
                style: const TextStyle(
                    fontSize: 17, color: white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.redAccent),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    discover_data_four[index]['viewers'],
                    style: TextStyle(color: white.withOpacity(0.5)),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: size.width / 3,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(tags.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Container(
                          decoration: BoxDecoration(
                              color: white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, top: 2, bottom: 2),
                            child: Text(
                              tags[index],
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: white.withOpacity(0.7),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
