import 'package:flutter/material.dart';
import 'package:glamify/components/profile_menu_item.dart';
import 'package:glamify/pages/login_page.dart';
import 'package:glamify/providers/auth_provider_hive.dart';

import 'package:glamify/services/auth/auth_services.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<Map> profileMenuItems = [
    {
      "icon": "assets/icon/account.png",
      "name": "Profil Saya",
      "onPressed": () {}
    },
    {
      "icon": "assets/icon/transaction.png",
      "name": "Riwayat Transaksi",
      "onPressed": () {}
    },
    {"icon": "assets/icon/moon.png", "name": "Mode Gelap", "onPressed": () {}},
    {
      "icon": "assets/icon/setting.png",
      "name": "Pengaturan",
      "onPressed": () {}
    },
  ];

  bool _isDark = false;
  int _index = 0;
  void setIndex() {
    setState(() {
      _index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthProviderHive authProviderHive =
        Provider.of<AuthProviderHive>(context, listen: false);
    final userData = authProviderHive.authCredential;

    return SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Segoe",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                _profileBio(userData),
                const SizedBox(
                  height: 32,
                ),
                ...profileMenuItems.map(
                  (menu) => ProfileMenuItem(
                    onPressed: menu['onPressed'],
                    icon: menu['icon'],
                    name: menu["name"],
                    isDark: _isDark,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: GestureDetector(
                    onTap: () async {
                      await AuthServices()
                          .signOut(); // Pastikan signOut sudah selesai
                      authProviderHive.clearToken();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                        (Route<dynamic> route) =>
                            false, // Hapus semua halaman sebelumnya
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/icon/log-out.png",
                              width: 28,
                            ),
                            const SizedBox(
                              width: 24,
                            ),
                            Text(
                              "Keluar",
                              style: const TextStyle(fontFamily: "Segoe"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                _askCustomerService(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _askCustomerService() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(
          51,
          58,
          115,
          0.2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/icon/headset.png",
            width: 28,
          ),
          const SizedBox(
            width: 16,
          ),
          const Text(
            "Feel free to ask, we ready to help",
            style: TextStyle(color: Color(0xff333A73), fontFamily: "Segoe"),
          )
        ],
      ),
    );
  }

  Widget _profileBio(userData) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(
            "assets/image/user.png",
            width: 70,
            height: 70,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userData['username'],
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: "Segoe",
                  fontWeight: FontWeight.bold,
                  color: Color(0xff323031),
                ),
              ),
              Text(
                userData['email'],
                style: const TextStyle(
                    fontFamily: "Segoe",
                    color: Color(0xff8E8E8E),
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ],
    );
  }
}
