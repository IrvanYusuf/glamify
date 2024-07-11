import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:glamify/models/cart_model.dart';
import 'package:glamify/providers/cart_provider.dart';

class OrderServices {
  // instasiasi collection orders
  final CollectionReference ordersRef =
      FirebaseFirestore.instance.collection("orders");

  // instansiasi collection carts
  final CollectionReference cartsRef =
      FirebaseFirestore.instance.collection("carts");

  // membuat order
  Future<bool> createOrder(String idUser, List<CartModel> cartItems,
      double totalAmount, double shippingCost, String shippingType) async {
    try {
      // Menyiapkan data untuk order
      final orderData = {
        'id_user': idUser,
        'cart_items': cartItems.map((item) => item.toMap()).toList(),
        'total_amount': totalAmount,
        'shipping_cost': shippingCost,
        'order_date': Timestamp.now(),
      };

      // Menambahkan data order ke Firestore
      await ordersRef.add(orderData);

      // Menghapus cart items
      // Menyusun ulang cartProvider setelah order berhasil
      CartProvider cartProvider = CartProvider();
      await cartProvider.clearCart(idUser);
      print("Order created successfully");
      return true;
    } catch (e) {
      print("error: $e");
      return false;
    }
  }
}
