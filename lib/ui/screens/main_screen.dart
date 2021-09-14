import 'package:flutter/material.dart';
import 'package:simple_gallery/const.dart';
import 'package:simple_gallery/ui/screens/albums_screen.dart';
import 'package:simple_gallery/ui/screens/feed_screen.dart';
import 'package:simple_gallery/ui/screens/users_screen.dart';

class MainScreen extends StatelessWidget {
  final List<MainTab> _tabs = [
    MainTab(
      title: Strings.mainTabUsers,
      widget: const UsersScreen()
    ),
    MainTab(
        title: Strings.mainTabFeed,
        widget: const FeedScreen()
    ),
    MainTab(
        title: Strings.mainTabAlbums,
        widget: const AlbumsScreen()
    )
  ];

  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _tabs.length,
        initialIndex: 1,
        child: Scaffold(
          appBar: AppBar(
            title: Text(Strings.appName,
              style: Styles.textHeaderStyle.copyWith(
                  color: MyColors.onPrimary
              ),
            ),
            bottom: TabBar(
              tabs: _tabs.map((e) => e.tab).toList(),
              indicatorColor: MyColors.secondary,
            ),
          ),
          body: TabBarView(children: _tabs.map((e) => e.widget).toList())
        )
    );
  }
}

class MainTab {
  late Tab tab;
  late Widget widget;

  MainTab({
    required String title,
    required Widget widget
  }) {
    this.tab = Tab(text: title);
    this.widget = widget;
  }
}
