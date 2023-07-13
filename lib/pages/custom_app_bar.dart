import 'package:flutter/material.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:twitch_clone/pages/pages.dart';
import 'package:twitch_clone/theme/colors.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: getAppBar(),
          ),
        ),
        bottomNavigationBar: getFooter(),
        body: getBody(),
      ),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: const [
        FollowingPage(),
        DiscoverPage(),
        BrowsePage(),
      ],
    );
  }

  Widget getFooter() {
    List iconItems = [
      MaterialCommunityIcons.cards_heart,
      MaterialCommunityIcons.compass,
      Ionicons.md_copy,
    ];
    List<String> labelItems = [
      "Following",
      "Discover",
      "Browser",
    ];
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        border: Border(
          top: BorderSide(
            width: 0.5,
            color: white.withOpacity(0.2),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            iconItems.length,
            (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    pageIndex = index;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      iconItems[index],
                      size: 30,
                      color: pageIndex == index
                          ? secondary
                          : white.withOpacity(0.5),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      labelItems[index],
                      style: TextStyle(
                        color: pageIndex == index
                            ? secondary
                            : white.withOpacity(0.5),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: bgColor,
      elevation: 0,
      leading: IconButton(
        // padding: const EdgeInsets.all(8),
        onPressed: () {},
        icon: CircleAvatar(
          radius: 20,
          backgroundColor: white.withOpacity(0.7),
          child: const Icon(
            AntDesign.user,
            color: black,
            size: 20,
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            AntDesign.wifi,
            size: 22,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            AntDesign.videocamera,
            size: 22,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            AntDesign.inbox,
            size: 25,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            MaterialCommunityIcons.comment_outline,
            size: 22,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            AntDesign.search1,
            size: 22,
          ),
        ),
      ],
    );
  }
}
