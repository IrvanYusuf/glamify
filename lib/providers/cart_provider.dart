import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:glamify/models/cart_model.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel> _cartItems = [];
  final CollectionReference cartRef =
      FirebaseFirestore.instance.collection("carts");

  List<CartModel> get cartItems => _cartItems;

  Future<bool> addItem(CartModel item) async {
    try {
      final existingProducts = cartRef
          .where('id_user', isEqualTo: item.id_user)
          .where('id_product', isEqualTo: item.id_product);

      final querySnapshot = await existingProducts.get();

      if (querySnapshot.docs.isNotEmpty) {
        final docId = querySnapshot.docs.first.id;
        final existingItem =
            querySnapshot.docs.first.data() as Map<String, dynamic>;
        final existingQuantity = existingItem['quantity'] as int;
        final newQuantity = existingQuantity + (item.quantity ?? 1);

        await cartRef.doc(docId).update({
          'quantity': newQuantity,
          'total_price': (item.price?.toDouble() ?? 0) * newQuantity,
        });

        _cartItems.removeWhere((cartItem) =>
            cartItem.id_user == item.id_user &&
            cartItem.id_product == item.id_product);

        notifyListeners();
      } else {
        await cartRef.add(item.toMap());
        _cartItems.add(item);
        notifyListeners();
      }

      return true;
    } catch (e) {
      print('Failed to add item to Firebase: $e');
      return false;
    }
  }

  Future<List<CartModel>> getCart(String idUser) async {
    try {
      final QuerySnapshot productItems =
          await cartRef.where('id_user', isEqualTo: idUser).get();

      if (productItems.docs.isEmpty) {
        return [];
      }

      _cartItems = productItems.docs
          .map((doc) => CartModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      notifyListeners();
      return _cartItems;
    } catch (e) {
      print('Failed to fetch items from Firebase: $e');
      throw Exception("error: ${e.toString()}");
    }
  }

  void removeItem(int idProduct) {
    _cartItems.removeWhere((item) => item.id_product == idProduct);
    notifyListeners();
  }

  // void clearCart(idUser) {
  //   _cartItems.clear();
  //   notifyListeners();
  // }

  double get totalAmount {
    return _cartItems.fold(0.0, (sum, item) => sum + (item.total_price ?? 0));
  }

  // Menghapus cart items berdasarkan idUser
  Future<bool> clearCart(String idUser) async {
    try {
      final cartDocs = await cartRef.where('id_user', isEqualTo: idUser).get();
      for (var doc in cartDocs.docs) {
        await doc.reference.delete();
      }
      print("Cart cleared successfully");
      _cartItems.clear();
      notifyListeners();
      return true;
    } catch (e) {
      print("Error clearing cart: $e");
      return false;
    }
  }
}
