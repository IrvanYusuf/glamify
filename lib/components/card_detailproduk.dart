import 'package:flutter/material.dart';
import 'package:glamify/pages/detail_product_page.dart';
import 'package:glamify/models/ProductModel.dart';

class CardProduk extends StatelessWidget {
  final ProductModel product;

  const CardProduk({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailProductPage(
              id: product.id!,
              category: product.category!,
            ),
          ),
        );
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      product.image ?? "https://via.placeholder.com/150"),
                ),
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title ?? "Nama Produk",
                    style: TextStyle(
                      fontFamily: 'segoe',
                      fontSize: 16,
                      color: Color(0xff323031),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "\$ ${product.price?.toStringAsFixed(2) ?? "0.00"}",
                    style: TextStyle(
                      fontFamily: 'segoe',
                      fontSize: 14,
                      color: Color(0xff323031),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
