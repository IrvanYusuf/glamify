import 'package:flutter/material.dart';
import 'dart:math';

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
    },
    {
      "icon": "assets/icon/transaction.png",
      "name": "Riwayat Transaksi",
    },
    {
      "icon": "assets/icon/moon.png",
      "name": "Mode Gelap",
    },
    {
      "icon": "assets/icon/setting.png",
      "name": "Pengaturan",
    },
    {
      "icon": "assets/icon/log-out.png",
      "name": "Keluar",
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
                _profileBio(),
                const SizedBox(
                  height: 32,
                ),
                ...profileMenuItems.map(
                  (menu) => _profileMenuItem(
                    menu['icon'],
                    menu['name'],
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

  Row _profileMenuItem(String icon, String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              icon,
              width: 28,
            ),
            const SizedBox(
              width: 24,
            ),
            Text(
              name,
              style: const TextStyle(fontFamily: "Segoe"),
            ),
          ],
        ),
        (name != "Mode Gelap"
            ? Transform.rotate(
                angle: 180 * pi / 180,
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/icon/arrow-left.png",
                    width: 22,
                  ),
                ),
              )
            : Switch.adaptive(
                value: _isDark,
                applyCupertinoTheme: true,
                onChanged: (newValue) {
                  setState(() {
                    _isDark = newValue;
                  });
                })),
      ],
    );
  }

  Widget _profileBio() {
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
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Irvan Yusuf Cahyadi",
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Segoe",
                  fontWeight: FontWeight.bold,
                  color: Color(0xff323031)),
            ),
            Text(
              "irvan@gmail.com",
              style: TextStyle(
                  fontFamily: "Segoe",
                  color: Color(0xff8E8E8E),
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ],
    );
  }
}
