import 'package:flutter/material.dart';
import 'package:fluttertest/ecomerApp1/presentation/screen/account_screen.dart';
import 'package:fluttertest/ecomerApp1/presentation/screen/home_screen.dart';
import 'package:fluttertest/ecomerApp1/presentation/screen/shopping_screen.dart';
import 'package:fluttertest/ecomerApp1/presentation/screen/wish_list_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ValueNotifier<int> currentindex = ValueNotifier(0);
  @override
  Widget build(final BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentindex,
      builder:
          (final context, final value, final child) => Scaffold(
            body: AnimatedSwitcher(
              duration: const Duration(seconds: 4),
              child: IndexedStack(
                index: value,
                children: const [
                  HomeScreen(),
                  ShoppingScreen(),
                  WishListScreen(),
                  AccountScreen(),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: value,
              onTap: (value) {
                currentindex.value = value;
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_outlined),
                  label: "shopping",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border_outlined),
                  label: "favorit",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "account",
                ),
              ],
            ),
          ),
    );
  }
}
