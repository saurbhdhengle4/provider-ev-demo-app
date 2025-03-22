import 'package:evdemoapp/providers/login_provider.dart';
import 'package:evdemoapp/providers/navigation_provider.dart';
import 'package:evdemoapp/providers/them_provider.dart';
import 'package:evdemoapp/views/chargers_view.dart';
import 'package:evdemoapp/views/home_view.dart';
import 'package:evdemoapp/views/menu_view.dart';
import 'package:evdemoapp/views/miles_view.dart';
import 'package:evdemoapp/views/sessions_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final signUpProvider = Provider.of<AuthProvider>(context);

    final List<Widget> screens = [
      const HomeView(),
      const SessionsView(),
      const ChargersView(),
      const MilesView(),
      const MenuView(),
    ];

    final List<Widget> title = [
      appbarTitle("${signUpProvider.userName} ✨"),
      appbarTitle("Sessions"),
      appbarTitle("My Chargers"),
      Container(),
      Container(),
    ];
    final List<Widget> appbarLeading = [
      Container(),
      backButton(navigationProvider),
      backButton(navigationProvider),
      Container(),
      Container(),
    ];
    return Scaffold(
      backgroundColor: themeProvider.backgroundColor,
      appBar: AppBar(
        backgroundColor: themeProvider.backgroundColor,
        title: title[navigationProvider.currentIndex],
        centerTitle: true,
        leading: appbarLeading[navigationProvider.currentIndex],
        actions: [
          IconButton(
            icon: Icon(
                themeProvider.isDarkMode ? Icons.dark_mode : Icons.light_mode),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: screens[navigationProvider.currentIndex],
      bottomNavigationBar: screenWidth < 600
          ? Stack(
              clipBehavior: Clip.none,
              children: [
                // Box shadow effect (Top Shadow)
                Positioned(
                  top: -4,
                  left: 0,
                  right: 0,
                  height: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.12),
                          spreadRadius: 0,
                          blurRadius: 14,
                          offset: const Offset(0, -4),
                        ),
                      ],
                    ),
                  ),
                ),
                BottomNavigationBar(
                  elevation: 0,
                  currentIndex: navigationProvider.currentIndex,
                  onTap: (index) {
                    navigationProvider.changeIndex(index);
                  },
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: themeProvider.backgroundColor,
                  selectedItemColor: Color(0xFF4772F5),
                  unselectedItemColor: const Color(0xFF98A2B3),
                  selectedLabelStyle: GoogleFonts.manrope(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    height: 1.7,
                    letterSpacing: 0.3,
                  ),
                  unselectedLabelStyle: GoogleFonts.manrope(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    height: 1.7,
                    letterSpacing: 0.3,
                  ),
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: "Home"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.bolt), label: "Sessions"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.ev_station), label: "Chargers"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.wallet), label: "C. Miles"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.menu), label: "Menu"),
                  ],
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    [
                      Icons.home,
                      Icons.bolt,
                      Icons.ev_station,
                      Icons.wallet,
                      Icons.menu
                    ][index],
                    color: navigationProvider.currentIndex == index
                        ? Color(0xFF4772F5)
                        : const Color(0xFF98A2B3),
                  ),
                  onPressed: () => navigationProvider.changeIndex(index),
                );
              }),
            ),
    );
  }

  InkWell backButton(NavigationProvider navigationProvider) {
    return InkWell(
        onTap: () {
          navigationProvider.changeIndex(navigationProvider.currentIndex - 1);
        },
        child: Icon(Icons.arrow_back));
  }

  Text appbarTitle(String text) {
    return Text(
      text,
      style: GoogleFonts.manrope(
        fontWeight: FontWeight.w700,
        fontSize: 16,
        height: 1.6,
        letterSpacing: 0.2,
        textStyle: const TextStyle(
          fontFeatures: [FontFeature.enable('smcp')],
        ),
      ),
      textAlign: TextAlign.center,
    );
  }
}
