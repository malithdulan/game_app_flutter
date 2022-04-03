import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_app/ui/pages/category_list/category_list_page.dart';
import 'package:game_app/ui/pages/game_list/game_list_page.dart';

import '../game_details/game_details_page.dart';

class HomePage extends StatelessWidget {
  static const String name = "/homePage";
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: Colors.deepOrange,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Games",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: "User",
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              routes: {
                GameDetailsPage.name: (context) => const GameDetailsPage(),
              },
              builder: (context) => const CupertinoPageScaffold(
                child: CategoryListPage(),
              ),
            );
          case 1:
            return CupertinoTabView(
              routes: {
                GameDetailsPage.name: (context) => const GameDetailsPage(),
              },
              builder: (context) => const CupertinoPageScaffold(
                child: GameListPage(),
              ),
            );
          default:
            return CupertinoTabView(
              builder: (context) => const CupertinoPageScaffold(
                child: GameDetailsPage(),
              ),
            );
        }
      },
    );
  }
}
