import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:glamify/components/card_detailproduk.dart';
import 'package:glamify/providers/ProductProvider.dart';
import 'package:glamify/models/ProductModel.dart';
import 'package:glamify/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductProvider productProvider = ProductProvider();
  late Future<List<ProductModel>> fetchProducts;
  late Future<List<dynamic>> getDataCategories;

  String currentCategory = 'All';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchProductsByCategory();
    getDataCategories = productProvider.getCategories();
  }

  void fetchProductsByCategory() {
    setState(() {
      if (currentCategory == 'All') {
        fetchProducts = productProvider.fetchProducts();
      } else {
        fetchProducts = productProvider.fetchSimilarProducts(currentCategory);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: true);
    print(cartProvider.cartItems.length);
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      badgeContent: Text(
                        cartProvider.cartItems.length.toString(),
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
                  child: TextField(
                    onSubmitted: (value) {},
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
                  icon: Container(
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
                Text("Categories ${currentCategory}"),
                const SizedBox(
                  height: 16,
                ),
                FutureBuilder(
                  future: getDataCategories,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      final categories = snapshot.data;
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(categories!.length, (index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 16),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    currentCategory = categories[index];
                                    fetchProductsByCategory();
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    foregroundColor:
                                        currentCategory == categories[index]
                                            ? Color(0xFFF2F2F2)
                                            : Color(0xff333A73),
                                    backgroundColor:
                                        currentCategory == categories[index]
                                            ? Color(0xff333A73)
                                            : Color(0xFFF2F2F2),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                child: Text(categories[index]),
                              ),
                            );
                          }),
                        ),
                      );
                    }
                  },
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
                child: FutureBuilder(
                  future: fetchProducts,
                  builder: (context, snapshot) {
                    print("snapshot: ${snapshot.data}");
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasData) {
                      return GridView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                        ),
                        itemBuilder: (context, index) {
                          final product = snapshot.data![index];
                          return CardProduk(product: product);
                        },
                      );
                    } else {
                      return Center(
                        child: Text("no data"),
                      );
                    }
                  },
                )),
          ),
        ],
      ),
    );
  }
}
