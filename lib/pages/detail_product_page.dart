import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:glamify/components/card_detailproduk.dart';
import 'package:glamify/models/ProductModel.dart';
import 'package:glamify/providers/ProductProvider.dart';
import 'package:glamify/utils/custom_money_formatter.dart';
import 'package:glamify/utils/toast.dart';

class DetailProductPage extends StatefulWidget {
  final int id;
  final String category;
  const DetailProductPage({
    Key? key,
    required this.id,
    required this.category,
  }) : super(key: key);

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  ProductProvider productProvider = ProductProvider();
  late Future<ProductModel> fetchProductsById;
  late Future<List<ProductModel>> fetchProductsByCategory;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchProductsById = productProvider.fetchProductById(widget.id);
    fetchProductsByCategory =
        productProvider.fetchSimilarProducts(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        FutureBuilder(
            future: fetchProductsById,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                final product = snapshot.data;
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image.network(
                                    product!.image!,
                                    // fit: BoxFit.fitWidth,
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                  ),
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            product!.title ?? "Nama Produk",
                                            style: TextStyle(
                                                fontFamily: 'segoe',
                                                fontSize: 16,
                                                color: Color(0xff323031)),
                                            maxLines: 1,
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.star_rate_rounded,
                                                  color: Colors.amber[300]),
                                              Text(product.rating!.rate
                                                  .toString()),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            "\$. ${product.price}",
                                            style: TextStyle(
                                                fontFamily: 'segoe',
                                                fontSize: 14,
                                                color: Color(0xff323031)),
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          Text(
                                            product.description!,
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.black45,
                                              fontFamily: 'segoe',
                                            ),
                                            textAlign: TextAlign.justify,
                                          ),
                                          SizedBox(
                                            height: 32,
                                          ),
                                          Text(
                                            "Produk serupa lainnya",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.black,
                                              fontFamily: 'segoe',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FutureBuilder(
                                    future: fetchProductsByCategory,
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      } else if (snapshot.hasData) {
                                        return Expanded(
                                          child: GridView.builder(
                                            shrinkWrap: true,
                                            itemCount: snapshot.data!.length,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              mainAxisSpacing: 20,
                                              crossAxisSpacing: 20,
                                            ),
                                            itemBuilder: (context, index) {
                                              final similarProducts =
                                                  snapshot.data![index];
                                              return CardProduk(
                                                  product: similarProducts);
                                            },
                                          ),
                                        );
                                      }
                                      return Center(
                                        child: Text("no data"),
                                      );
                                    },
                                  ),
                                ),
                              ]);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            toast(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff333A73),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            "Masukkan Keranjang",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                );
              }
            }),
        Positioned(
          top: 70,
          left: 20,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Image.asset(
                "assets/icon/arrow-left.png",
                width: 25,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
