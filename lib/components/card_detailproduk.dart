import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:glamify/models/ProductModel.dart';
import 'package:glamify/pages/detail_product_page.dart';

class CardProduk extends StatelessWidget {
  final ProductModel product;
  const CardProduk({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailProductPage(
                          id: product.id!,
                          category: product.category!,
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
                      image: NetworkImage(product.image!),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title ?? "Nama Produk",
                        style: TextStyle(
                            fontFamily: 'segoe',
                            fontSize: 16,
                            color: Color(0xff323031)),
                        maxLines: 1,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.star_rate_rounded,
                              color: Colors.amber[300]),
                          Text(product.rating!.rate.toString()),
                        ],
                      ),
                      Text(
                        "\$. ${product.price}",
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
    );
  }
}
