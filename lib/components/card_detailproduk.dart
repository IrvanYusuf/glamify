import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glamify/pages/detail_product_page.dart';
import 'package:glamify/pages/wallet_page.dart';
import 'package:glamify/utils/custom_money_formatter.dart';

class CardProduk extends StatefulWidget {
  const CardProduk({super.key});

  @override
  State<CardProduk> createState() => _CardProdukState();
}

class _CardProdukState extends State<CardProduk> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailProductPage(
              id: 1,
            ),
          ),
        );
      },
      child: Container(
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: 150,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadiusDirectional.vertical(
                        top: Radius.circular(10)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/image/shoes.png",
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Nama Produk",
                      style: TextStyle(
                          fontFamily: 'Segoe',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xff323031)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      customMoneyFormatter(150000).toString(),
                      style: TextStyle(
                        color: Color(0xff323031),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
