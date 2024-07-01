import 'package:flutter/material.dart';
import 'package:glamify/utils/custom_money_formatter.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ListView(
            children: [
              _cardWalletContainer(context),
              _menuWallet(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Riwayat Transaksi",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff1e1e1e),
                        fontFamily: 'Segoe',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    _cardWalletTransaction(),
                    _cardWalletTransaction(),
                    _cardWalletTransaction(),
                    _cardWalletTransaction(),
                    _cardWalletTransaction(),
                    _cardWalletTransaction(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cardWalletTransaction() {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(20, 0, 0, 0),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nama Produk",
                    style: TextStyle(
                      color: Color(0xff8E8E8E),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Sepatu Baru",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff323031),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Harga",
                    style: TextStyle(
                      color: Color(0xff8E8E8E),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    customMoneyFormatter(120000),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xff333A73),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order No",
                    style: TextStyle(
                      color: Color(0xff8E8E8E),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "ORD09878us",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff323031),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tanggal Order",
                    style: TextStyle(
                      color: Color(0xff8E8E8E),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "22 Juni 2024",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff323031),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Padding _menuWallet() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Menu",
            style: TextStyle(
              fontSize: 18,
              color: Color(0xff1e1e1e),
              fontFamily: 'Segoe',
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                // width: 50,
                // height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffEBEBEB),
                ),
                child: Image.asset(
                  "assets/icon/wallet-menu-icon.png",
                  width: 40.0,
                  height: 40.0,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Top Up",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff808080),
                  fontFamily: 'Segoe',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cardWalletContainer(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(120, 51, 58, 115),
            blurRadius: 20,
            spreadRadius: 4,
            offset: Offset(0, 4),
          )
        ],
        color: Color(0xff333A73),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: const DecorationImage(
                      image: AssetImage("assets/image/user.png"),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "Hallo, Irvan",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Segoe",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 158,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/wallet-bg.jpg"),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "IRVAN YUSUF CAHYADI",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Segoe",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "**** **** **** 0987",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: "Segoe",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset("assets/icon/copy.png"),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Your Balance",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontFamily: "Segoe",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          customMoneyFormatter(1000000),
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: "Segoe",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
