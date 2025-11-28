import 'package:bottom_tab_bar/data/constants.dart';
import 'package:bottom_tab_bar/data/notifiers.dart';
import 'package:bottom_tab_bar/views/pages/add_page.dart';
import 'package:bottom_tab_bar/views/pages/favorites_page.dart';
import 'package:bottom_tab_bar/views/pages/home_page.dart';
import 'package:bottom_tab_bar/views/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:bottom_tab_bar/widgets/navbar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Widget> pages = [
  HomePage(),
  FavoritesPage(),
  AddPage(),
  LoginPage(),
  //SettingsPage()
];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kereső APP', style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),),
        backgroundColor: Colors.cyan,
        actions: [
          IconButton(
            onPressed: () async {
              isDarkModeNotifier.value = !isDarkModeNotifier.value;

              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              await prefs.setBool(
                KConstants.isDarkMode,
                isDarkModeNotifier.value,
              );
            },
            icon: ValueListenableBuilder(
              valueListenable: isDarkModeNotifier,
              builder: (context, isDarkMode, child) {
                return Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode);
              },
            ),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, value, child) {
          return pages.elementAt(value);
        },
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
