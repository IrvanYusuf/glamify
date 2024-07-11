import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:glamify/components/custom_cart_card.dart';
import 'package:glamify/models/cart_model.dart';
import 'package:glamify/providers/cart_provider.dart';
import 'package:glamify/utils/custom_money_formatter.dart';

class CartPage extends StatefulWidget {
  final String idUser;
  const CartPage({super.key, required this.idUser});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late CartProvider cartProvider;
  late Future<List<CartModel>>? fetchCarts;
  double totalAmount = 0.0;

  @override
  void initState() {
    super.initState();
    cartProvider = CartProvider();
    fetchCarts = cartProvider.getCart(widget.idUser);
    fetchCarts!.then((cartItems) {
      setState(() {
        totalAmount =
            cartItems.fold(0.0, (sum, item) => sum + (item.total_price ?? 0));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Keranjang",
          style: TextStyle(
            fontFamily: "Segoe",
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Color(0xff323031),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FutureBuilder<List<CartModel>>(
            future: fetchCarts,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                  child: Text('Your cart is empty.'),
                );
              } else {
                final cartItems = snapshot.data!;
                // Update total amount
                totalAmount = cartItems.fold(
                    0.0, (sum, item) => sum + (item.total_price ?? 0));

                return Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return CustomCartCard(
                        title: item.title ?? '',
                        price: item.price ?? 0,
                        quantity: item.quantity ?? 0,
                        urlImage: item.url_image ?? "",
                        totalPrice: item.total_price ?? 0,
                      );
                    },
                  ),
                );
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(
                      color: Color(0xff323031),
                      fontFamily: "Segoe",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    customMoneyFormatter(totalAmount),
                    style: const TextStyle(
                      color: Color(0xff323031),
                      fontFamily: "Segoe",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const DottedLine(
            dashColor: Color(0xffC0C0C0),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/checkout');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff333A73),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Beli",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
