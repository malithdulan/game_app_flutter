import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_app/ui/pages/category_list/category_list_page.dart';
import 'package:game_app/ui/pages/game_list/game_list_page.dart';
import 'package:game_app/ui/pages/sign_in/sign_in_page.dart';
import 'package:game_app/ui/pages/user_details/user_details_page.dart';

import '../game_details/game_details_page.dart';

class HomePage extends StatefulWidget {
  static const String name = "/homePage";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final GlobalKey<NavigatorState> firstTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> secondTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> thirdTabNavKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
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
        onTap: (index) {
          if (currentIndex == index) {
            //only go to root when click their respective tabBottom icon, this expression avoid going to root when changing the tabs.
            switch (index) {
              case 0:
                firstTabNavKey.currentState?.popUntil((route) => route.isFirst);
                break;
              case 1:
                secondTabNavKey.currentState
                    ?.popUntil((route) => route.isFirst);
                break;
              case 2:
                thirdTabNavKey.currentState?.popUntil((route) => route.isFirst);
                break;
            }
          }
          currentIndex = index;
        },
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              navigatorKey: firstTabNavKey,
              routes: {
                GameDetailsPage.name: (context) => const GameDetailsPage(),
              },
              builder: (context) => const CupertinoPageScaffold(
                child: SignInPage(),
              ),
            );
          case 1:
            return CupertinoTabView(
              navigatorKey: secondTabNavKey,
              routes: {
                GameDetailsPage.name: (context) => const GameDetailsPage(),
              },
              builder: (context) => const CupertinoPageScaffold(
                child: GameListPage(),
              ),
            );
          default:
            return CupertinoTabView(
              navigatorKey: thirdTabNavKey,
              builder: (context) => const CupertinoPageScaffold(
                child: UserDetailsPage(),
              ),
            );
        }
      },
    );
  }
}
