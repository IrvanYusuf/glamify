import 'dart:math';
import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.name,
    required this.isDark,
    // required this.setState,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String icon;
  final String name;
  final bool isDark;
  // final ValueChanged<bool> setState;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
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
                    value: isDark,
                    onChanged: (newValue) {
                      // setState(newValue);
                    },
                  )),
          ],
        ),
      ),
    );
  }
}
