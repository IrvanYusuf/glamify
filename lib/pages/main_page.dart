import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glamify/pages/cart_page.dart';
import 'package:glamify/pages/checkout_page.dart';
import 'package:glamify/pages/home_page.dart';
import 'package:glamify/pages/login_page.dart';
import 'package:glamify/pages/notification_page.dart';
import 'package:glamify/pages/order_confirmation_page.dart';
import 'package:glamify/pages/profile_page.dart';
import 'package:glamify/pages/wallet_page.dart';
import 'package:glamify/providers/auth_provider_hive.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  late String userId;

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
  void initState() {
    super.initState();
    // Ambil data dari AuthProviderHive
    final authProviderHive =
        Provider.of<AuthProviderHive>(context, listen: false);
    final userData = authProviderHive.authCredential;
    userId = userData['uid'];
  }

  @override
  Widget build(BuildContext context) {
    // AuthProviderHive authProviderHive =
    //     Provider.of<AuthProviderHive>(context, listen: false);
    // final userData = authProviderHive.authCredential;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
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
                    label: _selectedIndex == 1 ? "Wallet" : "",
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      "assets/icon/${_selectedIndex == 2 ? "profile-active" : "profile"}.png",
                      width: 28,
                    ),
                    label: _selectedIndex == 2 ? "Profile" : "",
                  ),
                ],
              ),
            );
          } else {
            return const LoginPage();
          }
        },
      ),
      routes: {
        '/home': (context) => const MainPage(),
        '/notification': (context) => const NotificationPage(),
        // '/search': (context) => const SearchPage(),
        '/cart': (context) => CartPage(
              idUser: userId,
            ),
        '/checkout': (context) => CheckoutPage(idUser: userId),
        "/order-confirmation": (context) => const OrderConfirmationPage(),
      },
    );
  }
}
