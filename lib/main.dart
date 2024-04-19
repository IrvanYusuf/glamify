import 'package:flutter/material.dart';
import 'package:glamify/pages/cart_page.dart';
import 'package:glamify/pages/detail_product_page.dart';
import 'package:glamify/pages/home_page.dart';
import 'package:glamify/pages/profile_page.dart';
import 'package:glamify/pages/search_page.dart';
import 'package:glamify/pages/wallet_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> pages = [
    HomePage(),
    WalletPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onTap,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(
            color: Color(0xff122620),
            fontWeight: FontWeight.bold,
            fontFamily: "Segoe",
          ),
          unselectedLabelStyle: const TextStyle(
            color: Color(0xff122620),
            fontWeight: FontWeight.bold,
            fontFamily: "Segoe",
          ),
          useLegacyColorScheme: false,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icon/${_selectedIndex == 0 ? "home-active" : "home"}.png",
                width: 28,
              ),
              label: _selectedIndex == 0 ? "Home" : "",
            ),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icon/${_selectedIndex == 1 ? "wallet-active" : "wallet"}.png",
                  width: 28,
                ),
                label: _selectedIndex == 1 ? "Wallet" : ""),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icon/${_selectedIndex == 2 ? "profile-active" : "profile"}.png",
                  width: 28,
                ),
                label: _selectedIndex == 2 ? "Profile" : ""),
          ],
        ),
      ),
      routes: {
        '/detail-product': (context) => const DetailProductPage(),
        '/search': (context) => const SearchPage(),
        '/cart': (context) => const CartPage(),
      },
    );
  }
}