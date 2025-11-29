import 'package:bottom_tab_bar/data/notifiers.dart';
import 'package:flutter/material.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({super.key});

  @override
  State<StatefulWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'Kezdőlap'),
            NavigationDestination(icon: Icon(Icons.star), label: 'Kedvencek'),
            NavigationDestination(icon: Icon(Icons.add_card), label: 'Új'),
            NavigationDestination(
              icon: Icon(Icons.login),
              label: 'Bejelentkezés',
            ),
            //NavigationDestination(icon: Icon(Icons.settings), label: 'Beálíltások'),
          ],
          selectedIndex: selectedPage,
          onDestinationSelected: (int value) {
            selectedPageNotifier.value = value;
          },
        );
      },
    );
  }
}
