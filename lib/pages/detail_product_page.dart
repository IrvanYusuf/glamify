import 'package:flutter/material.dart';
import 'package:glamify/components/card_detailproduk.dart';
import 'package:glamify/utils/custom_money_formatter.dart';
import 'package:glamify/utils/toast.dart';

class DetailProductPage extends StatelessWidget {
  final int id;
  const DetailProductPage({
    Key? key,
    required this.id,
  }) : super(key: key);

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
                  if (id == 1)
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/image/shoes.png",
                            width: 800.0,
                            fit: BoxFit.fitWidth,
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Sepatu Pria DadShoes",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.black,
                                        fontFamily: 'segoe',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      customMoneyFormatter(150000).toString(),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff333A73),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    const Text(
                                      "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an",
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
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: GridView.count(
                              shrinkWrap: true,
                              primary: false,
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              children: const [
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
                            ),
                          )
                        ])
                  else
                    const Column(children: [Text('Halaman Detail didukung')]),
                ],
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
            )
          ],
        ),
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
