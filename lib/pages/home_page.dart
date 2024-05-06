import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:glamify/components/card_detailproduk.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List dataCategories = [
    "All",
    "Clothes",
    "Eletronics",
    "Furniture",
    "Shoes",
    "Micellaneous",
  ];
  String selectedCategory = 'All';

  void setSelectedCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

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
                      color: Color(0xff333A73)),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
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
                Expanded(
                  child: Container(
                    height: 50,
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'cari....',
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        fillColor: Color(0xFFF2F2F2),
                        filled: true,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/search");
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
                const Text(
                  'Kategori',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Segoe',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: dataCategories.map((category) {
                      return Container(
                        margin: const EdgeInsets.only(right: 8),
                        child: ElevatedButton(
                          onPressed: () {
                            setSelectedCategory(category);
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: (selectedCategory == category
                                ? const Color(0xFFF2F2F2)
                                : const Color.fromARGB(255, 8, 8, 8)),
                            backgroundColor: (selectedCategory == category
                                ? const Color(0xff333A73)
                                : const Color(0xFFF2F2F2)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(category),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  GridView.count(
                    primary: false,
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
          )
        ],
      ),
    );
  }
}
