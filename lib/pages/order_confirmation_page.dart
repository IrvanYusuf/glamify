import 'package:flutter/material.dart';

class OrderConfirmationPage extends StatelessWidget {
  const OrderConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/image/order-confirmation.png"),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: const Text(
                    "Thank You For Your\n Order",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Segoe"),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Text(
                  "Kami Bangga Menjadi Bagian dari\n Pengalaman Belanja Anda",
                  style: TextStyle(
                    fontFamily: "Segoe",
                    color: Color(
                      0xff8e8e8e,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 36,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/home");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff333A73),
                    fixedSize:
                        Size.fromWidth(MediaQuery.of(context).size.width),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Kembali ke Home",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: "Segoe"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
