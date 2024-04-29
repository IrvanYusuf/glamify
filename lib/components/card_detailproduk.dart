import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glamify/pages/detail_product_page.dart';

class CardProduk extends StatefulWidget {
  const CardProduk({super.key});

  @override
  State<CardProduk> createState() => _CardProdukState();
}

class _CardProdukState extends State<CardProduk> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailProductPage(
                            id: 1,
                          )),
                );
              },
              child: Column(
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/image/shoes.png"),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Nama Produk",
                          style: TextStyle(
                              fontFamily: 'segoe',
                              fontSize: 16,
                              color: Color(0xff323031)),
                        ),
                        const Text(
                          "Rp. 150.00",
                          style: TextStyle(
                              fontFamily: 'segoe',
                              fontSize: 14,
                              color: Color(0xff323031)),
                        )
                      ],
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
