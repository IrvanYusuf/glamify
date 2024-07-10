import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:glamify/components/card_detailproduk.dart';
import 'package:glamify/pages/detail_product_page.dart';
import 'package:glamify/providers/ProductProvider.dart';
import 'package:glamify/models/ProductModel.dart';
import 'package:glamify/providers/auth_provider_hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchProducts = productProvider.fetchProducts();
    getDataCategories = productProvider.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    AuthProviderHive authProviderHive = Provider.of(context, listen: true);
    print("auth credential: ${authProviderHive.authCredential}");
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
                const Text('Categories'),
                const SizedBox(
                  height: 16,
                ),
                FutureBuilder(
                  future: getDataCategories,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
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
                              margin: EdgeInsets.only(right: 16),
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(categories[index]),
                                style: ElevatedButton.styleFrom(
                                    foregroundColor: const Color(0xFFF2F2F2),
                                    backgroundColor: const Color(0xff333A73),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
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
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return GridView.builder(
                          itemCount: snapshot.data!.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                          ),
                          itemBuilder: (context, index) {
                            final product = snapshot.data![index];
                            return CardProduk(product: product);
                          },
                        );
                      }
                    })),
          ),
        ],
      ),
    );
  }
}
