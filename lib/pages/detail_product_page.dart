import 'package:flutter/material.dart';
import 'package:glamify/components/card_detailproduk.dart';
import 'package:glamify/models/ProductModel.dart';
import 'package:glamify/providers/ProductProvider.dart';

class DetailProductPage extends StatelessWidget {
  final int id;
  final String category;
  DetailProductPage({Key? key, required this.id, required this.category})
      : super(key: key);

  final ProductProvider productProvider = ProductProvider();

  @override
  Widget build(BuildContext context) {
    print(category);
    return Scaffold(
      body: FutureBuilder<ProductModel?>(
        future: productProvider.fetchProductById(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('Product not found'));
          }

          final product = snapshot.data!;
          return Stack(
            children: [
              ListView(
                children: [
                  Image.network(
                    product.image ?? "https://via.placeholder.com/150",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title ?? "Nama Produk",
                          style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontFamily: 'segoe',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          product.description ??
                              "Deskripsi produk tidak tersedia.",
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black45,
                            fontFamily: 'segoe',
                          ),
                        ),
                        const SizedBox(height: 32),
                        const Text(
                          "Produk serupa lainnya",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontFamily: 'segoe',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        FutureBuilder<List<ProductModel>>(
                          future:
                              productProvider.fetchSimilarProducts(category),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            } else if (!snapshot.hasData ||
                                snapshot.data!.isEmpty) {
                              return const Center(
                                  child: Text('No similar products found'));
                            }

                            final similarProducts = snapshot.data!;
                            print(similarProducts);
                            return GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20,
                              ),
                              itemCount: similarProducts.length,
                              itemBuilder: (context, index) {
                                return CardProduk(
                                    product: similarProducts[index]);
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 10,
                left: 10,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    color: Colors.white,
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      "assets/icon/arrow-left.png",
                      width: 25,
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
