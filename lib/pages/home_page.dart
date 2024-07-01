import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:glamify/components/card_detailproduk.dart';
import 'package:glamify/pages/detail_product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Glamify",
                  style: TextStyle(
                    fontFamily: 'segoe',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff333A73),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/notification");
                      },
                      icon: Image.asset(
                        "assets/icon/bell-icon.png",
                        height: 25.0,
                      ),
                    ),
                    badges.Badge(
                      position: badges.BadgePosition.topEnd(top: 0, end: 0),
                      badgeContent: const Text(
                        "4",
                        style: TextStyle(color: Colors.white),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/cart");
                        },
                        icon: Image.asset(
                          "assets/icon/cart-icon.png",
                          height: 25.0,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'search',
                        border: InputBorder.none,
                        fillColor: Color(0xFFF2F2F2),
                        filled: true),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    //
                    Navigator.pushNamed(context, '/search');
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xfff2f2f2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      "assets/icon/search.png",
                      width: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Categories'),
                const SizedBox(
                  height: 16,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('All'),
                        style: ElevatedButton.styleFrom(
                            foregroundColor: const Color(0xFFF2F2F2),
                            backgroundColor: const Color(0xff333A73),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Clothes'),
                        style: ElevatedButton.styleFrom(
                            foregroundColor: const Color.fromARGB(255, 8, 8, 8),
                            backgroundColor: const Color(0xFFF2F2F2),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Electronics'),
                        style: ElevatedButton.styleFrom(
                            foregroundColor: const Color.fromARGB(255, 8, 8, 8),
                            backgroundColor: const Color(0xFFF2F2F2),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Furniture'),
                        style: ElevatedButton.styleFrom(
                            foregroundColor: const Color.fromARGB(255, 8, 8, 8),
                            backgroundColor: const Color(0xFFF2F2F2),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Shoes'),
                        style: ElevatedButton.styleFrom(
                            foregroundColor: const Color.fromARGB(255, 8, 8, 8),
                            backgroundColor: const Color(0xFFF2F2F2),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Micellaneous'),
                        style: ElevatedButton.styleFrom(
                            foregroundColor: const Color.fromARGB(255, 8, 8, 8),
                            backgroundColor: const Color(0xFFF2F2F2),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    children: [
                      CardProduk(),
                      CardProduk(),
                      CardProduk(),
                      CardProduk(),
                      CardProduk(),
                      CardProduk(),
                      CardProduk(),
                      CardProduk(),
                      CardProduk(),
                      CardProduk(),
                      CardProduk(),
                      CardProduk(),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
