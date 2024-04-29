import 'package:flutter/material.dart';
import 'package:glamify/components/card_detailproduk.dart';
import 'package:glamify/pages/home_page.dart';

class DetailProductPage extends StatelessWidget {
  final int id;
  DetailProductPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            Expanded(
              child: ListView(
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
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Sepatu Pria DadShoes",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.black,
                                        fontFamily: 'segoe',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    Text(
                                      "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black45,
                                        fontFamily: 'segoe',
                                      ),
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
                          SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: GridView.count(
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
                            ),
                          )
                        ])
                  else
                    const Column(children: [Text('Halaman Detail didukung')]),
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
              Navigator.pushNamed(context, "/home");
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
      ]),
    );
  }
}
