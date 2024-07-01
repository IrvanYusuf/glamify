import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:glamify/components/card_detailproduk.dart';
import 'package:glamify/models/ProductModel.dart';
import 'package:glamify/providers/ProductProvider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductProvider productProvider = ProductProvider();
  late Future<List<ProductModel>> _fetchProduct;

  @override
  void initState() {
    super.initState();
    _fetchProduct = productProvider.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/icon/bell-icon.png",
                        height: 25.0,
                      ),
                    ),
                    badges.Badge(
                      position: badges.BadgePosition.topEnd(top: 0, end: 0),
                      badgeContent: Text("4"),
                      child: IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/icon/cart-icon.png",
                          height: 25.0,
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        'assets/image/user.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'search',
                      border: InputBorder.none,
                      fillColor: Color(0xFFF2F2F2),
                      filled: true,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/search');
                  },
                  icon: Image.asset(
                    "assets/icon/search.png",
                    height: 25.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Categories'),
                const SizedBox(height: 16),
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
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Clothes'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: const Color.fromARGB(255, 8, 8, 8),
                          backgroundColor: const Color(0xFFF2F2F2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Electronics'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: const Color.fromARGB(255, 8, 8, 8),
                          backgroundColor: const Color(0xFFF2F2F2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Furniture'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: const Color.fromARGB(255, 8, 8, 8),
                          backgroundColor: const Color(0xFFF2F2F2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Shoes'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: const Color.fromARGB(255, 8, 8, 8),
                          backgroundColor: const Color(0xFFF2F2F2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Miscellaneous'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: const Color.fromARGB(255, 8, 8, 8),
                          backgroundColor: const Color(0xFFF2F2F2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FutureBuilder<List<ProductModel>>(
                future: _fetchProduct,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text('No products found'),
                    );
                  } else {
                    return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final product = snapshot.data![index];
                        return CardProduk(product: product);
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
