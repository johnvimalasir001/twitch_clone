import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:twitch_clone/data/datas.dart';
import 'package:twitch_clone/pages/pages.dart';
import 'package:twitch_clone/theme/colors.dart';

class FollowingPage extends StatefulWidget {
  const FollowingPage({Key? key}) : super(key: key);

  @override
  State<FollowingPage> createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Following",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: white),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Channels Recommended for You",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: white),
          ),
          const SizedBox(
            height: 15,
          ),
          getVideoLists()
        ],
      ),
    );
  }

  Widget getVideoLists() {
    var size = MediaQuery.of(context).size;
    return Column(
      children: List.generate(following_data.length, (index) {
        List tags = following_data[index]['tags'];
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => LiveStreamingPage(
                    tags: tags,
                    name: following_data[index]['name'],
                    profile: following_data[index]['img_profile'],
                    title: following_data[index]['title'],
                    type: following_data[index]['type'],
                    viewers: following_data[index]['viewers'],
                    videoUrl: following_data[index]['video_url'],
                  ),
                ),
              );
            },
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: size.width * 0.32,
                          height: 80,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  following_data[index]['img_video'],
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Positioned(
                          bottom: 1,
                          left: 5,
                          child: Row(
                            children: [
                              Container(
                                width: 9,
                                height: 9,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.redAccent),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                following_data[index]['viewers'],
                                style: const TextStyle(color: white),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: SizedBox(
                        height: 110,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            following_data[index]
                                                ['img_profile']),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Flexible(
                                  child: Text(
                                    following_data[index]['name'],
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: white),
                                    maxLines: 1,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    following_data[index]['title'],
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: white.withOpacity(0.5),
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Entypo.dots_three_vertical,
                                  color: white.withOpacity(0.5),
                                  size: 20,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    following_data[index]['type'],
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: white.withOpacity(0.5),
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                              ],
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
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
                                          left: 8,
                                          right: 8,
                                          top: 2,
                                          bottom: 2,
                                        ),
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
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
